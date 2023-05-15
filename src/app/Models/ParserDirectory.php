<?php

namespace Migrations\Parser\App\Models;

use Migrations\Parser\App\Abstracts\ParserAbstract;

final class ParserDirectory extends ParserAbstract
{
    final public function getListMigrations(string $source): array
    {
        return [];
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
