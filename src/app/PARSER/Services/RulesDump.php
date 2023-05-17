<?php

namespace Migrations\Parser\App\PARSER\Services;

use Migrations\Parser\App\PARSER\Contracts\RulesInterface;
use Migrations\Parser\App\PARSER\Enums\MigrationMethodsPrepare;

class RulesDump implements RulesInterface
{
    public function checkCreateStart(string $raw): bool
    {
        return !!preg_match('/CREATE(.|\s+)TABLE/', $raw);
    }
    public function checkCreateEnd(string $raw): bool
    {
        return !!preg_match('/(?<=(\s|.|\)))(ENGINE|CHARSET|COLLATE).+;/', $raw);
    }

    public function getTabeNames(string $createDataRaw): array
    {
        preg_match('/(?<=(CREATE\sTABLE\s`))[a-zA-Z_-]+(?=`)/', $createDataRaw, $matches);
        return $matches ?? [];
    }

    public function getColumnNames(string $createDataRaw): array
    {
        preg_match_all('/(?<!(CREATE\sTABLE\s`))(?<=`)([a-zA-Z_-]+)(?=`)/', $createDataRaw, $matches);
        return $matches ?? [];
    }

    public function getColumnType(string $createDataRaw): array
    {
        preg_match_all('/(?<=`)(?<=[a-zA-Z+]`)(\s+[a-zA-Z]+\(\d+\)|\s+[a-zA-Z]+)/', $createDataRaw, $matches);
        return $matches ?? [];
    }

    public function getColumnLength(string $columnType): int
    {
        preg_match('/\d+/', $columnType, $length);

        return (int)current($length);
    }
}
