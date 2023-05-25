<?php

namespace Migrations\Parser\App\PARSER\Helpers;

use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Process;

class FormatingFile
{

    const WORK_PATH = __DIR__ . "/../../../../";

    private static function prepareRunCommand(string $command, string ...$args): string
    {
        return sprintf($command, ...$args);
    }

    private static function checkCorrectExecution($resultOfExecution): array
    {
        if ($resultOfExecution->successful()) {
            return [
                'status' => 'success',
                'result' => $resultOfExecution->output(),
            ];
        }
        Log::error($resultOfExecution->output());
        return [
            'status' => 'error',
            'result' => $resultOfExecution->output(),
        ];
    }

    public static function formatingFileByPsrStandart(string $pathToFiles, string $psrStandart): void
    {
        Process::path(self::WORK_PATH)
            ->run(self::prepareRunCommand("composer exec  -v phpcbf -- --standard=%s %s", $psrStandart, $pathToFiles));
    }

    public static function checkCorrectFiles(string $pathToFiles)
    {
        $result = Process::path(self::WORK_PATH)
            ->run(self::prepareRunCommand("composer exec -v phplint %s", $pathToFiles));
        return self::checkCorrectExecution($result);
    }
}
