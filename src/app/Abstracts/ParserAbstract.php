<?php

namespace Migrations\Parser\App\Abstracts;

use Migrations\Parser\App\PARSER\Enums\TypeParserEnums;
use Migrations\Parser\App\PARSER\Services\MigrationFile;
use Migrations\Parser\App\PARSER\Services\ProcessFile;
use Migrations\Parser\App\PARSER\Services\StructureTable;

abstract class ParserAbstract
{
    abstract function getListMigrations(string $source): array;
    abstract function getTableList(string $source): string;
    abstract function getCountTables(string $source): int;

    protected function getListThroughData(string $typeOfParser, string $source): array
    {
        return match (mb_strtolower($typeOfParser)) {
            TypeParserEnums::FILE->value => [
                new ProcessFile($source),
                StructureTable::class,
                MigrationFile::class,
            ],
            TypeParserEnums::DIRECTORY->value => [],
            default => []
        };
    }
}
