<?php

namespace Migrations\Parser\App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Log;
use Migrations\Parser\App\PARSER\Helpers\FormatingFile;
use Migrations\Parser\App\PARSER\Helpers\GenerateMigrationFile;
use Throwable;

class CreateMigrationCommandAsync extends Command
{
    protected $signature = 'migration:generate {tables*}';

    protected $description = 'create migration files';

    const FILE_PATH_DIRECTORY = __DIR__ . "/../../../database/migrations/";

    //TODO Make this Pipline process
    private function checkCorrectMigrationFiles()
    {
        FormatingFile::formatingFileByPsrStandart($this::FILE_PATH_DIRECTORY, 'PSR12');
        $resultOfCheck = FormatingFile::checkCorrectFiles($this::FILE_PATH_DIRECTORY);

        if ($resultOfCheck['status'] === 'error') {
            //TODO make delete new migration files
            dd($resultOfCheck['result']);
        }
    }

    public function handle()
    {
        $helper = new GenerateMigrationFile();
        $tables = $this->argument('tables');
        foreach ($tables as $tableName => $tableColumns) {
            $fileName = $helper->makeFilePath($this::FILE_PATH_DIRECTORY, $tableName);
            $fileContent = $helper->generateFinalFile($tableName, $tableColumns);
            //TODO add to Mement $fileName
            try {
                File::put($fileName, $fileContent);
            } catch (Throwable $error) {
                Log::error($error->__toString());
            }
        }
        $this->checkCorrectMigrationFiles();
    }
}
