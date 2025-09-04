import { NextResponse } from "next/server";
import { createAdminClient } from "@/lib/supabase/admin";

export const runtime = "nodejs";

export async function POST(request: Request) {
  try {
    const body = await request.json();
    const { userId, newRole, password } = body as { userId: string; newRole: string; password: string };

    if (password !== "221114") {
      return NextResponse.json({ error: "Invalid password" }, { status: 403 });
    }

    if (!userId || !newRole) {
      return NextResponse.json({ error: "Missing userId or newRole" }, { status: 400 });
    }

    const supabase = createAdminClient();

    const { error } = await supabase
      .from("users")
      .update({ role: newRole })
      .eq("id", userId);

    if (error) {
      return NextResponse.json({ error: error.message }, { status: 400 });
    }

    return NextResponse.json({ success: true });
  } catch (err: any) {
    return NextResponse.json({ error: err?.message || "Unexpected error" }, { status: 500 });
  }
}




