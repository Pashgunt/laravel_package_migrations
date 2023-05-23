<?php

namespace Migrations\Parser\App\PARSER\Enums;

class  MigrationMethodsEnums
{

    const PRIMARY_KEY_METHOD = 'id';

    const METHODS = [
        'varchar' => "string",
        'timestamp' => "timestamp",
        'datetime' => 'dateTime',
        'tinyint' => 'tinyInteger',        
        'bigint' => 'unsignedBigInteger',
        'text' => 'text',
        'longtext' => 'longText',
        'mediumtext' => 'mediumText',
        'int' => 'integer',
    ];
}
