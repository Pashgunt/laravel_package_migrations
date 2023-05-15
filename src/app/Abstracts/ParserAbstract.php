<?php

namespace Migrations\Parser\App\Abstracts;

abstract class ParserAbstract
{
    abstract function createMigrations(string $source): int;
    abstract function getTableList(string $source): string;
    abstract function getCountTables(string $source): int;
}
