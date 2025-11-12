class AddUniqueIndexToPacientesRut < ActiveRecord::Migration[7.0]
  def change
    add_index :pacientes, :rut, unique: true
  end
end
