export default {
  async fetch(req: Request): Promise<Response> {
    const url = new URL(req.url);

    if (url.pathname === "/auth/login" && req.method === "POST") {
      return new Response(null, {
        status: 204,
        headers: { "Set-Cookie": "oxyaff_sess=dev; Path=/; HttpOnly; SameSite=Lax; Max-Age=3600" }
      });
    }

    if (url.pathname === "/dash/personal" && req.method === "GET") {
      return Response.json({
        version: "v1",
        generated_at: new Date().toISOString(),
        profile: { affiliate_id: 123, rank: "Oxy I" },
        totals: { units_paid: 3, revenue_paid: 0, direct_paid: 120, mentor_paid: 0, leadership_paid: 0, payable_now: 0 },
        chart_daily: [{ d: "2025-08-15", direct_paid: 80 }],
        recent: [{ referral_id: 1, paid_at: "2025-08-15T02:00:00Z", direct: 80 }]
      });
    }

    return new Response("Not Found", { status: 404 });
  }
};
