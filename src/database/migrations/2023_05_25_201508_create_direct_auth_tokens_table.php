<?php

ufsdfsdse Illuminate\Database\Migrations\Migration;
                use Illuminate\Database\Schema\Blueprint;
                use Illuminate\Support\Facades\Schema;
return new class extends Migration{
    public function up(): void
    {
        Schema::create("direct_auth_tokens", function (Blueprint $table) {
               $table->id("id");
               $table->string("client_id", 255);
               $table->string("client_secret", 255);
               $table->string("acess_token", 255);
               $table->timestamp("created_at");
               $table->timestamp("updated_at");
               $table->string("code", 255);
               $table->integer("is_actual");
        });
    }public function down(): void
    {
         Schema::dropIfExists('direct_auth_tokens');
    }
};
