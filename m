Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB7E3CE0B8
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jul 2026 11:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783079790; cv=none; b=ANpo8TX+p6Ww3sqacLJooNiI+L5XIZdMooyKexx2a96c+XgWCzcmlrMJBHa1K2gYNt9a5cOSHxbQR7aGh/6I8BiyDZCLO6/cnW5cCh4HA2NocKEMR3Il2QaHbWW4lleKXbC36ayC9sWNdk5EkTw4rRMMeD+CVUNjBlNcjbO6DDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783079790; c=relaxed/simple;
	bh=hOFZgLaEu0fgbaHLQ2K0UZhu3A++ABratulLxCJEZq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cDq/qoaugtb0D2/ho52HrG4H1bNzbDZ7Ss1xnsYOpJC4S1gLZbQeoORYeFJOPgBn7hEev/ThCFdH7u6sROD8ecJ2Xj0VqFFaNWuIiIG0FjeRFuMLsrMeGwoj6s2MY/6uuFyw4q0zg8fZ/InKMjAyTYfvbsleOQ/nsSvaqSfshjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z6rL4aJb; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z6rL4aJb"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c8b49639fbaso370286a12.0
        for <chrome-platform@lists.linux.dev>; Fri, 03 Jul 2026 04:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783079788; x=1783684588; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzs61HZr2e08vLjlcHcnU81Qx3P3Xyhgqf6PYo21bZc=;
        b=Z6rL4aJbf0LUs929pHKs+WrsNjQnEWcTbJUd8Yyxw3lu7BNqmd+rB6iPwhQxnTyCE4
         F0khJFtmZ8Fn3QeSPUJws7TFyt1aFcAcwIvXtjpfFTa5E/hkmpFhUZfIh9uWaZgORds+
         DUg/6Ji9moGMI2KHDspkXFXwVBVbyymmR1h7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783079788; x=1783684588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gzs61HZr2e08vLjlcHcnU81Qx3P3Xyhgqf6PYo21bZc=;
        b=n84l3vSbC/9vkqnkiUjDRLqCM7IANrPOKMT9ajQfB4EQYfvvPqsClIMr5SM+EJ6kOh
         ZVTPPg26iS/OartzLVZhfzdvH3ffYByCgg/z0vy0g+4SIjxp2ARSIAvgKF3PIQVOcUMw
         jtGgnTDZJ2B58eVnpIAXHcrHXZooLkqZkbvLHL31TClclJKHFvs2Ao2aJAv2SCAaAOnH
         dAqLOQbax0ZO7u/05waFYaKjQnUZRTTwbHjwcXL4f9EPhC0g1emodegXl4fF+Zqpr50B
         GBLy7YJrN7LvJX7A3yHLgwgFwHN8yUBw1bCgjNKRUSsEfrXUdOrIIAejF9Px4yAPibTa
         lOow==
X-Forwarded-Encrypted: i=1; AFNElJ/NNrADY3FLgfk26oPK3pjgFrj1OtsvzuCktGjaL2D0MLCf+BTvzihjSVJWN2i6leviIbk9iNmNzhxAPT/S1Ms=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0ZW8qRkI+efwim05RYebiRn7vyaQnWQsQ87G9NxZpLwt190T4
	JxblOBqV1igyuuGokgMBXZtzY1MBu6JywFvEkry7/R5ZGBjSdpDXtQeyFUbRUdYvYg==
X-Gm-Gg: AfdE7cnd4eXf13gp7w8+d3NSt60zettMxyEcsqNy+i2r8J4xLllQecXZ3N5Krn6YJOU
	bqkyH9I6EsLkG2ocWXyNVp32+iuAcvNsRkWM40MuZELmtRU+r/A2PtTJoStxU3OFk3w7p706aIR
	a00xdCnq4hqB24I4T/svhzRU6IOYWndTecSmMu9X+hHCouq9LLgBc3qgYl/Z6q51P30JZ7aQaEW
	SEvOuNffnfKqY0jyktsr6oxLCkUgkYPQjExaAAJoZVYMEnvNNjsun+0ppBRyvfNTzpTGV0zZeqR
	t8U+XE78Z6ndURtT3zfXyNRWaUUoXepgfzl9PgoNXryV+0a0DUohWNynov8siDl7M+ZTkd03q2M
	zvA88wIjw8dtsECkKvx55phL46ZzITqR/6BChbTfc6h1CqEEbaabNvp7EmD/2uSJ/9R0haO8XKD
	qKsYnzh6Q4cAFdvrJ6rEtCwYWBI3rPNCI0YQ+xMwsU9YAQtN+MhvCKZ05v2Dt8Dv7hv+QO4A==
X-Received: by 2002:a05:6a21:1f84:b0:3bf:77d7:667d with SMTP id adf61e73a8af0-3bfed47019dmr11801134637.28.1783079787514;
        Fri, 03 Jul 2026 04:56:27 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8bd30ca5sm2569540a12.0.2026.07.03.04.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:56:27 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] platform/chrome: of_hw_prober: Add delay for hana trackpads
Date: Fri,  3 Jul 2026 19:55:58 +0800
Message-ID: <20260703115601.1323491-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703115601.1323491-1-wenst@chromium.org>
References: <20260703115601.1323491-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Up until now, the MT8173 elm/hana device tree has set the dedicated
regulator supplying the trackpad as always-on, simply because the Elan
driver was missing proper delays. As a result the delay for the
Synaptics trackpad was also omitted, as it was not strictly required
under such a model and delayed the availability of the trackpad to the
user.

The Elan driver recently gained proper delays after power-up, with
adaptive skipping of the delay if the regulator was originally
on. The I2C HID driver and I2C OF component prober library gained
similar adaptive delay skipping. The device tree will be fixed to have
the regulator not be always on, and proper post-power-on delay time
added to the I2C HID device.

Also add the post-power-on delay to the ChromeOS OF component prober,
so that if the regulator is off at the time of probing, the prober knows
to wait for the hardware to initialize.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index 8562a0e89dc6..54d8941617e2 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -70,10 +70,8 @@ static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
 		/*
 		 * ELAN trackpad needs 2 ms for H/W init and 100 ms for F/W init.
 		 * Synaptics trackpad needs 100 ms.
-		 * However, the regulator is set to "always-on", presumably to
-		 * avoid this delay. The ELAN driver is also missing delays.
 		 */
-		.post_power_on_delay_ms = 0,
+		.post_power_on_delay_ms = 110,
 	},
 };
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog

