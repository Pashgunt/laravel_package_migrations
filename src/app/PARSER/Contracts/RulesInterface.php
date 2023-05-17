<?php

namespace Migrations\Parser\App\PARSER\Contracts;

interface RulesInterface
{
    public function checkCreateStart(string $raw): bool;
    public function checkCreateEnd(string $raw): bool;
    public function getTabeNames(string $createDataRaw): array;
    public function getColumnNames(string $createDataRaw): array;
    public function getColumnType(string $createDataRaw): array;
    public function getColumnLength(string $columnType): int;
}
