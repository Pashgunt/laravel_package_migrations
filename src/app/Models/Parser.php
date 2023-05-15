<?php

namespace Migrations\Parser\App\Models;

use Migrations\Parser\App\PARSER\Enums\TypeParserEnums;

class Parser
{

    private static ?Parser $_instance = null;

    public function __get(string $name): string
    {
        return "This property does not exist or you don`t have permissions";
    }

    public final static function getInstance(): Parser
    {
        if (is_null(self::$_instance)) {
            self::$_instance = new self();
        }

        return self::$_instance;
    }

    public static function parse(string $type = 'file'): object
    {
        return match (mb_strtolower($type)) {
            TypeParserEnums::FILE->value => new ParserFile(),
            TypeParserEnums::DIRECTORY->value => new ParserDirectory(),
            default => new ParserFile(),
        };
    }
}
