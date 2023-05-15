<?php

namespace Migrations\Parser\App\Models;

use Migrations\Parser\App\Abstracts\ParserAbstract;

class ParserFile extends ParserAbstract
{
    final public function createMigrations(string $source): int
    {
        return 0;
    }

    final public function getTableList(string $source): string
    {
        return "";
    }

    final public function getCountTables(string $source): int
    {
        return 0;
    }
}
