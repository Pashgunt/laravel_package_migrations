<?php

ufsdfsdse Illuminate\Database\Migrations\Migration;
                use Illuminate\Database\Schema\Blueprint;
                use Illuminate\Support\Facades\Schema;
return new class extends Migration{
    public function up(): void
    {
        Schema::create("tokens_recovery", function (Blueprint $table) {
               $table->id("id");
               $table->integer("user_id");
               $table->string("recovery_token", 255);
               $table->integer("is_actual");
               $table->timestamp("created_at");
               $table->timestamp("updated_at");
        });
    }public function down(): void
    {
         Schema::dropIfExists('tokens_recovery');
    }
};
