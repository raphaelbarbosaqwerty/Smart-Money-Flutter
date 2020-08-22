import 'package:floor/floor.dart';
import 'package:smart_money/app/shared/database/tables/entries/models/entries_model.dart';

@dao
abstract class EntriesDao {

  // @Query('SELECT SUM(amount) AS balance FROM entries')
  // Future<double> getBalance();

  // GetByCateogry

  @Query('SELECT * FROM entries')
  Future<List<EntriesModel>> getAllEntries();

  @Query('SELECT * FROM entries WHERE id = :id')
  Future<EntriesModel> getEntry(int id);

  @Query('DELETE FROM entries')
  Future<void> deleteAllEntries();

  @insert
  Future<int> insertEntry(EntriesModel entry);

  @update
  Future<int> updateEntry(EntriesModel entry);

  @delete
  Future<int> deleteEntry(EntriesModel entry);
}