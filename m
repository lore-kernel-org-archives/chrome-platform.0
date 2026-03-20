Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE042E06ED
	for <chrome-platform@lists.linux.dev>; Fri, 20 Mar 2026 08:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773995546; cv=none; b=pbhbYaDMKTll5SEkAlwQT5iAM8AOXLjU8L70vG8mhQAnfDceHnMnbfk6AAmQUR/ysvbfRQURN2r822QFkW2nq8qK8zEoWuDwK39/qnpxSUC4HCGSCAtaryn8CcnF4QwXr+FQL1fhGFalSj1XGVUq0lxY9K6KpAoX6/eVy3n0L/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773995546; c=relaxed/simple;
	bh=NMH1lM3fMo3/CvgbDrRdjr8Z3m/1BUIg1YK4rBIIENg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cgle83pgYC9hwtGufoq5yN98VDo/U0Ws3MOIGBFkNKKAZv5cew1RyI9avsHUmncZbB/G7oI5za3pSPTQKX1StVaAID/WD1xrLkUh+dgVfMR7bQvB/SHnEMoA3eGKrQHhwGVDBma2R/8N2qomPNBxQuN+YN8rRRDp/q4eQAQ5CDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oO2EJQUh; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oO2EJQUh"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82748257f5fso1935938b3a.1
        for <chrome-platform@lists.linux.dev>; Fri, 20 Mar 2026 01:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773995543; x=1774600343; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwKh84aPEwlbOzcwKg41QhnYITbrVcHTcrSie4jnTPo=;
        b=oO2EJQUh2drayfTxGvK/VwUh0l+oxSw7YpzdhZqsKewu9vHzJ3pPi7kc8PE7YYmwRl
         nY/VA3eJXMk3n6ukLvPUM0G86bWp5qkSCwED0yb1g1Mr31AO9ksqgSi3xjl4KVcCBklj
         yZuCS4i/iN7sUdQc0tMzRaugn67Id4cjzCfLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773995543; x=1774600343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uwKh84aPEwlbOzcwKg41QhnYITbrVcHTcrSie4jnTPo=;
        b=tT66pgPynDtjdCqiWUODJY/MK0nfVT+i9FoxBWnEn415sB3hU3/2K7h+By2CHhQd7B
         YMZ2wKP8jpQS0D7IhrxreRTVzO0a9wEYufIUDDOlAXOMVcnJvYRMkK2GLJRIPi8E0mve
         6FMI8GX1vpt3CG1raqK/tWK5y0VSyLTiUQFP8N4eHHgUL9nLnCcDeYSx7gV6j2xHtrlt
         SfgVNH3h2DobKv3Qhw88qfh5cB9DiDVn8i3lwwOR5AUJqqCcxgMJSNEBXtQ8/qs/h40w
         PuW12khmCYeNQNQHKVTLBuI+njzg2fCCWMWrioycfTjUdDtTsP84va+N/55IK8GhVP2r
         qang==
X-Forwarded-Encrypted: i=1; AJvYcCWgpg+o3J/SHgpa5847ZEV7GqfoGQLR+BWq7tQUDYDTDhJhb9h5GHirTdM45nv3J81WQxc/fANq3/8PG3TwWeo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxxAH8LteN5C9NjnTRG5UnZcuymF6YqMHMK2f6tJVsjusXnXGmC
	+MRJk50nDEOBXVAE6pJGQvsxErw3bga3wXULkfCqJRd0Yxh8ePKeMovvRuBskvylFHO0qC9/uDa
	vQbk=
X-Gm-Gg: ATEYQzxl4d5Ing2BujrUeQb7Ir3El12B9iwBsWd9r0QYQDp8FyjC3RJXqPaC/RJNFSj
	ozlm3nRzVYA5nRYBNcOh0r+7BZWP2XxXcDHmY0BnH+z/4sBgrXLU6YmhsQ2N07reYYk+m7Dd5KI
	/hKaeYwXzWn1gX/h2bQsjcj0EDnYPpaTOvB7XMtTk8SI3n6WAqYBQtnFw/ZOaR48amVWIQL9Sw6
	KDuf+Ihh3yq32p5Ka+yeWQoM0MRQdPH+cleqc0pYWKgJcYmGWaBGDsd+qrcd5BNq7wasMqocPwB
	iZqjfI3KpbTAJap8hcvqH3O+6fsjXSrUYWcBGdXBlBXOlnMzfCgSsP7D6e144fh3X3NndsVH0qh
	xQ9lML0oYf7Mto/+rtm8GAba46GIMmWqtMuL3NNJ+Es18wk21v7fYJAukLvUpwx7vzGxNWaEfGt
	axyon7POFjJ57BpKSuLMYRYblwWckuLAJSYON1hdHx/W8UobNnE3aMhqFZSElsFHTl6teBbNgi4
	mnzxPSd
X-Received: by 2002:a05:6a00:2e9b:b0:824:3ef6:a815 with SMTP id d2e1a72fcca58-82a7a80b69dmr5877135b3a.8.1773995543605;
        Fri, 20 Mar 2026 01:32:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b040debf9sm1408816b3a.47.2026.03.20.01.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:32:23 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 2/2] regulator: cros-ec: Add regulator supply
Date: Fri, 20 Mar 2026 16:31:33 +0800
Message-ID: <20260320083135.2455444-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320083135.2455444-1-wenst@chromium.org>
References: <20260320083135.2455444-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even a regulator remotely controlled by the EC will have a power supply
input.

Add the supply property name from the device tree binding to the
regulator description.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/regulator/cros-ec-regulator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/cros-ec-regulator.c b/drivers/regulator/cros-ec-regulator.c
index fb0767b33a36..aec275fe1f44 100644
--- a/drivers/regulator/cros-ec-regulator.c
+++ b/drivers/regulator/cros-ec-regulator.c
@@ -183,6 +183,7 @@ static int cros_ec_regulator_probe(struct platform_device *pdev)
 	desc->owner = THIS_MODULE;
 	desc->type = REGULATOR_VOLTAGE;
 	desc->ops = &cros_ec_regulator_voltage_ops;
+	desc->supply_name = "vin";
 
 	ret = cros_ec_regulator_init_info(dev, drvdata);
 	if (ret < 0)
-- 
2.53.0.959.g497ff81fa9-goog

