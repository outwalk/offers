class ChangeColumnsCollateUtf8UnicodeCi < ActiveRecord::Migration
  def up
    change_column :regions, :name_uk, "VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci"
    change_column :districts, :name_uk, "VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci"
    change_column :localities, :name_uk, "VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci"
  end

  def down
    change_column :regions, :name_uk, "VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci"
    change_column :districts, :name_uk, "VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci"
    change_column :localities, :name_uk, "VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci"
  end
end
