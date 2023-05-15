<?php

namespace Migrations\Parser\App\PARSER\Services;

use Generator;

class ReadFile
{

    private static ?ReadFile $_instance = null;

    final public static function getInstance(): ReadFile
    {
        if (is_null(self::$_instance)) {
            self::$_instance = new self();
        }

        return self::$_instance;
    }

    public function readTheFileAsync(string $filePath): Generator
    {
        $fieHandle = fopen($filePath, "r");

        while (!feof($fieHandle)) {
            yield trim(fgets($fieHandle));
        }

        fclose($fieHandle);
    }

    public function readTheFileSync(string $filePath): string
    {
        return file_get_contents($filePath);
    }
}
