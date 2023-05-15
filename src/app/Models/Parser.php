<?php

namespace Migrations\Parser\App\Models;

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
        switch (mb_strtolower($type)) {
            case "file":
                $parser = new ParserFile();
                break;
            case "directory":
                $parser = new ParserDirectory();
                break;
            default:
                $parser = new ParserFile();
        }

        return $parser;
    }
}
