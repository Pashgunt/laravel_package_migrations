<?php

namespace Migrations\Parser\App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Log;
use Migrations\Parser\App\PARSER\Helpers\GenerateMigrationFile;
use Throwable;

class CreateMigrationCommandAsync extends Command
{
    protected $signature = 'migration:generate {tables*}';

    protected $description = 'create migration files';

    const FILE_PATH_DIRECTORY = __DIR__ . "/../../../database/migrations/";

    public function handle()
    {
        $helper = new GenerateMigrationFile();
        $tables = $this->argument('tables');
        foreach ($tables as $tableName => $tableColumns) {
            $fileName = $helper->makeFilePath(CreateMigrationCommandAsync::FILE_PATH_DIRECTORY, $tableName);
            $fileContent = $helper->generateFinalFile($tableName, $tableColumns);
            try {
                File::put($fileName, $fileContent);
            } catch (Throwable $error) {
                Log::error($error->__toString());
            }
        }
    }
}
