class CreateStepFlows < ActiveRecord::Migration[7.0]
  def change
    create_table :step_flows do |t|
      t.references :story, null: false, foreign_key: true

      t.timestamps
    end
  end
end
