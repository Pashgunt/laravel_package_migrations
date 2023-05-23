<?php

namespace Migrations\Parser\App\PARSER\Services;

use Closure;
use Migrations\Parser\App\PARSER\Contracts\MementoInterface;
use Migrations\Parser\App\PARSER\Contracts\ProcessPiplineInterface;
use Migrations\Parser\App\PARSER\Enums\MigrationMethodsEnums;

class StructureTable extends RulesDump implements ProcessPiplineInterface
{
    private array $state = [];

    public function process(array $data, Closure $next): array
    {
        $dataStructure = [];

        foreach ($data as $tableStructure) {
            $columns = current($this->getColumnNames($tableStructure));
            $types = current($this->getColumnType($tableStructure));
            $values = $this->compareTypeMethods($columns, $types);
            $dataStructure[current($this->getTabeNames($tableStructure))] = array_combine($columns, $values);
        }

        return $next($dataStructure);
    }

    public function compareTypeMethods(array $columns, array $types): array
    {
        $result = [];
        foreach ($types as $index => $type) {
            if ($columns[$index] === 'id') {
                $result[] = [
                    'method' => MigrationMethodsEnums::PRIMARY_KEY_METHOD,
                    'length' => null,
                    'original' => $columns[$index]
                ];
            } else {
                $result[] = $this->prepareTypeForMethod($type);
            }
        }

        return $result;
    }

    public function prepareTypeForMethod(string $type): array
    {
        $coumnLengthValue = (int)$this->getColumnLength($type);
        if ($coumnLengthValue) {
            return [
                'method' => MigrationMethodsEnums::METHODS[trim(strtolower(current(explode('(', $type))))],
                'length' => $coumnLengthValue,
                'original' => $type
            ];
        }
        return [
            'method' => MigrationMethodsEnums::METHODS[trim(strtolower($type))],
            'length' => null,
            'original' => $type
        ];
    }

    public function save(): MementoInterface
    {
        return new MementoProcessFile($this->state);
    }
    public function restore(MementoProcessFile $mementoProcess): void
    {
        $this->state = $mementoProcess->getState();
    }
}
