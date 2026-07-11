create table if not exists public.declarations (
  id uuid primary key default gen_random_uuid(),
  nickname text not null default '匿名签署人',
  content text not null,
  is_hidden boolean not null default false,
  likes integer not null default 0,
  created_at timestamptz not null default now(),
  constraint declarations_nickname_length check (char_length(nickname) between 1 and 24),
  constraint declarations_content_length check (char_length(content) between 8 and 280),
  constraint declarations_likes_nonnegative check (likes >= 0)
);

alter table public.declarations enable row level security;

drop policy if exists "Public can read visible declarations" on public.declarations;
create policy "Public can read visible declarations"
on public.declarations
for select
to anon
using (is_hidden = false);

drop policy if exists "Public can create visible declarations" on public.declarations;
create policy "Public can create visible declarations"
on public.declarations
for insert
to anon
with check (
  is_hidden = false
  and likes = 0
  and char_length(nickname) between 1 and 24
  and char_length(content) between 8 and 280
);

create index if not exists declarations_visible_created_at_idx
on public.declarations (is_hidden, created_at desc);
