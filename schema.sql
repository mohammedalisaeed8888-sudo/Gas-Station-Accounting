-- شغّل هذا النص مرة واحدة في Supabase SQL Editor
create table if not exists public.shifts (
 id uuid primary key default gen_random_uuid(),
 work_date date not null,
 worker text not null check (worker in ('مجد','عمر')),
 pumps jsonb not null default '[]',
 debts jsonb not null default '[]',
 expenses jsonb not null default '[]',
 wallet_receipts jsonb not null default '[]',
 actual_cash numeric(14,2) not null default 0,
 actual_wallets jsonb not null default '[]',
 price numeric(12,2) not null default 325,
 calc jsonb not null default '{}',
 status text not null default 'submitted',
 created_at timestamptz not null default now()
);
alter table public.shifts enable row level security;
create policy "auth read shifts" on public.shifts for select to authenticated using (true);
create policy "auth insert shifts" on public.shifts for insert to authenticated with check (true);
create policy "auth update shifts" on public.shifts for update to authenticated using (true) with check (true);
create policy "auth delete shifts" on public.shifts for delete to authenticated using (true);
