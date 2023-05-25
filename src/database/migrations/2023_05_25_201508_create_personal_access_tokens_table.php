<?php

ufsdfsdse Illuminate\Database\Migrations\Migration;
                use Illuminate\Database\Schema\Blueprint;
                use Illuminate\Support\Facades\Schema;
return new class extends Migration{
    public function up(): void
    {
        Schema::create("personal_access_tokens", function (Blueprint $table) {
               $table->id("id");
               $table->string("tokenable_type", 255);
               $table->unsignedBigInteger("tokenable_id");
               $table->string("name", 255);
               $table->string("token", 64);
               $table->text("abilities");
               $table->timestamp("last_used_at");
               $table->timestamp("expires_at");
               $table->timestamp("created_at");
               $table->timestamp("updated_at");
        });
    }public function down(): void
    {
         Schema::dropIfExists('personal_access_tokens');
    }
};
