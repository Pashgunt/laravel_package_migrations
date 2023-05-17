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
                if (mb_strpos($type, '(')) {
                    $result[] = [
                        'method' => MigrationMethodsEnums::METHODS[trim(strtolower(current(explode('(', $type))))],
                        'length' => $this->getColumnLength($type),
                        'original' => $type
                    ];
                } else {
                    $result[] = [
                        'method' => MigrationMethodsEnums::METHODS[trim(strtolower($type))],
                        'length' => null,
                        'original' => $type
                    ];
                }
            }
        }

        return $result;
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
