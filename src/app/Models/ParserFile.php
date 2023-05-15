<?php

namespace Migrations\Parser\App\Models;

use Illuminate\Pipeline\Pipeline;
use Migrations\Parser\App\Abstracts\ParserAbstract;
use Migrations\Parser\App\PARSER\Enums\TypeParserEnums;

class ParserFile extends ParserAbstract
{
    final public function getListMigrations(string $source): array
    {
        return app(Pipeline::class)
            ->send([])
            ->through($this->getListThroughData(TypeParserEnums::FILE->value, $source))
            ->via('process')
            ->thenReturn();
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
