<?php

namespace Migrations\Parser\App\PARSER\Helpers;

use Migrations\Parser\App\Abstracts\HelperGeneratorAbstract;

class GenerateMigrationFile extends HelperGeneratorAbstract
{
    const CLASS_NAME = "return new class extends Migration{ \n";

    private function makeFileNameForTable(string $tableName): string
    {
        $stringFileName = date("Y_m_d_His") . "_create_%s_table.php";
        return sprintf($stringFileName, $tableName);
    }

    public function makeFilePath(string $path, string $tableName): string
    {
        $fileName = $this->makeFileNameForTable($tableName);
        return sprintf("%s%s", $path, $fileName);
    }

    private function defaultUseClasses(): string
    {
        return "use Illuminate\Database\Migrations\Migration;
                use Illuminate\Database\Schema\Blueprint;
                use Illuminate\Support\Facades\Schema; \n";
    }

    private function generateMethodUp(array $tableColumns, string $tableName): string
    {
        $method = "";
        $stringInitUpMethod = 'public function up(): void { Schema::create("%s", function (Blueprint $table) {';
        $method .= sprintf($stringInitUpMethod, $tableName);
        foreach ($tableColumns as $columnName => $columnSettings) {
            if ($columnSettings['length']) {
                $stringForCallMethodWithLength = '$table->%s("%s", %d);';
                $method .= sprintf($stringForCallMethodWithLength, $columnSettings['method'], $columnName, $columnSettings['length']);
            } else {
                $stringForCallMethodWithoutLength = '$table->%s("%s");';
                $method .= sprintf($stringForCallMethodWithoutLength, $columnSettings['method'], $columnName);
            }
        }
        $method .= "}); }";
        return $method;
    }

    private function generateMethodDown(string $tableName): string
    {
        $stringDownMethod = "public function down(): void { \n Schema::dropIfExists('%s'); } };\n";
        return sprintf($stringDownMethod, $tableName);
    }

    public function generateFinalFile(string $tableName, array $tableColumns): string
    {
        return sprintf(
            "%s%s%s%s%s",
            $this::PREFIX_FILE,
            $this->defaultUseClasses(),
            $this::CLASS_NAME,
            $this->generateMethodUp($tableColumns, $tableName),
            $this->generateMethodDown($tableName)
        );
    }
}
