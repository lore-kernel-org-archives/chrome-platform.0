Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792569472;
	b=GaY63Oh5EhqEdLpheidil6IWHeBKz7HCvHaGHvskNg238wAKqVnTRZqEhCDnSuo0QNH4
	 HGjrIZZyUpEh/h1REFH5fnl6j4x+adrA3tY9F6FHhphaVqpA/BQJVf1FRicFOFFwzEtca
	 0QwxBOOMoTFLRYs/D20QdMfzu2AIl+LwsNiUQFhtqVkJnMw6oIPOiXIitJFPjZqqmcJ5p
	 IdkT0auwSSgfU41d9iH68FcSmwnvoYJoqnK7eQtHfUzYj7dw44D6k4hBAEWIkw8Yd7JXY
	 IojDxWsTDrLxR6WbC2zL42YlF3Dt8vIVTca39EQT8XRRvQEyqEAOPwzpyWVC30uDmvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=b/9FPAXB5OMzTip3IOGW9at4j0vGcQAizKqkhvnReoM=;
	b=ZVuPFdiwPBPgMRvmNNhSvuB3Gy3VruWt//9oLVIdWRwi7r+2PvKeSzbUgy4VxgANCNaw
	 FGCokmglbCBQ3gV0yd29e59RpxI82ytFhkNPxOOO1PpgM4GEn/TiGBpDK901IIk/+yUup
	 U2EadNqdiy+wXLSQ4V2P0ETgGV92hRlR+M4IjSK5g9u30Le4ku2YBdBnH8Iq1Ho0i7we8
	 xL45MCGE+blHOC9lcr7hrBGOogk2Jl2alHHGD/KfRITDEfw7ct8DRXUswFDTPqr1qfy9H
	 zDb0ZeTz2xTcKwToN/tozzehrSeA2HFGLN1SeSk2hfKYz9HIcg4YPM6WKzk95rVaCsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starlabs.systems;
	spf=pass smtp.mailfrom=starlabs.systems;
	dkim=pass header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=T9W33iiJ;
	arc=fail smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CBC606A322
	for <chrome-platform@lists.linux.dev>; Wed, 21 Oct 2026 07:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00CBC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=T9W33iiJ
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6767d92cde6so381505d50.0
        for <chrome-platform@lists.linux.dev>; Wed, 21 Oct 2026 00:57:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792569470; cv=none;
        d=google.com; s=arc-20260327;
        b=ErK5+GHIqJyoIoKXfaJvmNDhPhs/SULEfWvLLglI5M9dyDLM5yTuM2kA9DiISHqA/J
         gyaaBqhFuZZEnC5n2vkxzFxeaEJejrL3mG5O/guU2Mdsq/kOZBxFkPo7HAw456+65qlx
         1OtoG7LyQB3lMB4aZfzhdc7Vc48t/qrre5+ot9NkQseAHKW1vZmqdMSyb3AlW8ucwlY1
         tg8oUEp93ipVB6U3N6SNbltkddlhpUUOvkMyhqlYZOAZt7kXgzLJjfTj9nVy+AUy6eRX
         zsjMyHb0BsKP9sJ/wjpzj8qU34GWeAEoSByCumgB3ujWDO8NuQ1YKOwKUqKosHLxnvzN
         GY3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=b/9FPAXB5OMzTip3IOGW9at4j0vGcQAizKqkhvnReoM=;
        fh=Qbh1ZSmqU483XBb8YWaFp2x+3Ut+U8s8v8AW01cE2yw=;
        b=edf1swwl+o6i+HpeF4maFn8RoW3meFgluuX2+yQMZSfdWvxU5/hArB1cDTpj7QAM5G
         qaHBgfo6wRN3O/JlgpAERIUXDw6KtrQxRZY0vaQ5MkHSKSMqLPkNewp2K6qK+BCrh9i0
         LMN38gfL66RyMGZZb47lNPZWs6I1YM5yRl8cp1sbPO3zLVL5WdC3nQOYSJbsHnJUipsM
         engkO2+7vDVKCBl6A9JWgXl6yhAM7qr8lRIX4xowhgK0OtpVThCn9+hDLhSG3FHvW879
         Y1/CZ45nl/E7zsmorP0DbfvGgPkY/tMmtFlHBoqOnLpF2AjZ4AiDGy1yshegckAYt1VC
         6T1A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1792569470; x=1793174270; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b/9FPAXB5OMzTip3IOGW9at4j0vGcQAizKqkhvnReoM=;
        b=T9W33iiJcWUwMhcJjm5HZiBDCm3rCqAJ9fkbFDnJkLPaO0DgJfsI0lUUPFKtE6wtzJ
         Qw7Q2NfuE7kuTLwofQeG6PJ+OQvuo0yfkJMF57sEGuNQqN1gdjTYx2M0YJ3fbvFPVSuE
         wVlcwK/o6h/Z7fKvWBC8LvPwnRRk50X8rEPtr7HQulamcRjZNtZ8C6Q4u7spdePPaHSZ
         MjEi6rxqUDT/6bZGYdlTkSmLRe5s9opN7fzIh0983m1yurd+APGGJxDk+A259/kFRo4c
         ZTxTJGEIiemNyJPofTmbRt0ms51YjnbCN7cHw6BolJlTwaCngS6L6/XPE11yyG37vwt1
         P0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569470; x=1793174270;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b/9FPAXB5OMzTip3IOGW9at4j0vGcQAizKqkhvnReoM=;
        b=eyH7NEwReMbxciOXEPQ6X6v/TD/att1X5fnAyk4ieKcdnM4cdpxjRBRdlIO++KgWSu
         ZSMlHjXR4UBK1z6wCn5iSyKqEviOOSdEYJV9RsNPgWArVBh52doSB9lY9XREVVG6QeV+
         wpycHXM9zA+95PU8z1sWK7DsAT2McBLzbLxoemoH4xxPyBhfGZsTXcyexcUjDMcZ+Wei
         aa7rxg1kLQExe43XcE/52LfINz2Li2eSySoaWxnWVp+TD9i3ph9qJpTXGkhx6DHmxyar
         +JWLL/8SzmkNv7yo4L6J1H0kHEAMLWq7mzylfuZ3vhphi8dLVK7feQ2TMv1nH1bvMIix
         3J2g==
X-Forwarded-Encrypted: i=1; AKwUvBwTyjLWf2VYCNi80tX5KdAcOJxl+/5OvkB2/yL4tAtLkKdzu1MMS68GrgnrMscm4FhPPQGmESBi/Aw9jGXNVuA=@lists.linux.dev
X-Gm-Message-State: AFq9FYIHNyQAG/ws7K6gg0pk/f5FXRRoKajzHvrba8QBTip4l42Ox0Qo
	shZW93ct757rJ7JUfSb7IlMGEnAQhdWGxo9XIWzx6fp5lbDi7zkSyTaZUO9CFXjqUoXiVkUsAMi
	pEDH3psOkAU250UlvgOSNfPI4QvVAIO8fajkOyPON
X-Gm-Gg: AYBFou0JeTVi8LtFS9SffLJ+drc3EhLecn+qzu8dGR1kzMLsWXyl/P6A6y97r6AKWz0
	Q9Fzql9KziW3HcImwO1LrpFwK4jDgMtLE0bgzLTAwoHefMnz+ozJsxOhXfqRCLtSjlVtB4UCWDK
	C/krA/yzaoPCV8QXxKaCBl7DuYIoBJOc+pbPukJjy10c0JqTyG+GuLJbVu64JbdPu/D86tlb1fD
	8Qh/+uiAbZStygWsB7aqshSMteY22VRPHh93kViMx0hIdDyK0GgZdiEs6732O6L0YbDoDTQeC7e
	RYLtHCZAtDIzfQJSJNKkxWMpNzub5BsDyZN2ZCGPTlganQsFJVu+JKHcCwCYTiy86MM2iWeTeKT
	cFYwAMWrDwO5QIafB7KY2nW27ffPYRrxZ8jaAWL07AgujdxIB3EWBq1D4zSnroAiHqmI=
X-Received: by 2002:a05:690e:e8b:b0:677:c6f6:8cac with SMTP id
 956f58d0204a3-67a0dded6d0mr669334d50.0.1792569469623; Wed, 21 Oct 2026
 00:57:49 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 21 Oct 2026 07:57:49 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 21 Oct 2026 07:57:49 +0000
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: sean@starlabs.systems
Date: Wed, 21 Oct 2026 07:57:49 +0000
X-Gm-Features: AclHuK9CuFn6XAC-EPzrIm8Q5Qt2Oj5aACWiFtIwVz9D5V0ryk4CO-CPJLqqTfU
Message-ID: <CABtds-16eUH6ah3Rr9R=N2605TPdFgDekM5oXVeWqGcmYfWqag@mail.gmail.com>
Subject: [PATCH] firmware: coreboot: Fix CFR error-pointer handling warning
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	kernel test robot <lkp@intel.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From 4e74bf1ccc0f61b4712f688eab66a7750f693243 Mon Sep 17 00:00:00 2001
From: Sean Rhodes <sean@starlabs.systems>
Date: Wed, 21 Oct 2026 08:55:54 +0100
Subject: [PATCH] firmware: coreboot: Fix CFR error-pointer handling warning

The scoped kfree cleanup already ignores error pointers, so passing the
pointer through no_free_ptr() before PTR_ERR() is unnecessary. It also
makes the IS_ERR/PTR_ERR expressions appear inconsistent to Coccinelle.

Return PTR_ERR() directly. The scoped cleanup still leaves error pointers
untouched while freeing successful allocations on later returns.

Fixes: f2e05ce9763f ("firmware: coreboot: Add CFR firmware attributes driver")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610210637.LiJ3U0ob-lkp@intel.com/
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 drivers/firmware/coreboot/coreboot-cfr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/coreboot/coreboot-cfr.c
b/drivers/firmware/coreboot/coreboot-cfr.c
index 2d9ea5d213d8..61d5191b5447 100644
--- a/drivers/firmware/coreboot/coreboot-cfr.c
+++ b/drivers/firmware/coreboot/coreboot-cfr.c
@@ -341,7 +341,7 @@ static int coreboot_cfr_read_value(const struct
coreboot_cfr_setting *setting,
 	int ret;

 	if (IS_ERR(efi_name))
-		return PTR_ERR(no_free_ptr(efi_name));
+		return PTR_ERR(efi_name);

 	ret = efivar_lock();
 	if (ret)
-- 
2.53.0
