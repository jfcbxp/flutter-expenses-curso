import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        transactions.isEmpty
            ? Column(
                children: [
                  Text(
                    "Nenhum dado disponivel",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  )
                ],
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final tr = transactions[index];
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: FittedBox(child: Text('R\$${tr.value}')),
                        ),
                      ),
                      title: Text(
                        tr.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      subtitle: Text(
                        DateFormat('d MMM y').format(tr.date),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => onRemove(tr.id),
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  );
                }),
      ],
    );
  }
}
