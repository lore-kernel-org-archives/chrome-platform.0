Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF250270540
	for <chrome-platform@lists.linux.dev>; Fri, 20 Mar 2026 08:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773995541; cv=none; b=jQEPPOewwA6XhnkEvzW/16Z/DI/sM9GPzGMQhvMz7fpr+DKe5atT/l/tDCPngXBrkQSEdCKyjDMmNSsYVuUkG5FM4aXVNF05do1dqqR0tOxiHg07V6OwS+G4optla1tsZehP3TNtrrZEjQWfpFWBbgT+z+dslyM2JrPBEtvlluE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773995541; c=relaxed/simple;
	bh=o0xvVEhUW+BvD9VQEi4vmFi15CEsqzEBHjcVziN/X8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K1iihVvBj43hS0zxk++f7FbaS9J58+v5PjWCvD8a7Nn+0i2kp5Z34B1f3O3sHdkKyona7AxTM9DS7lHHniMaazFZg5uxZ/H7hafSK9DRhtzVoYdM2pcqVestd3/hzO8JxZmL+H+7QY16LWPxgXFHkaxTLW8XPUAQ/a3fYoW9d44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mrZVJIJr; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mrZVJIJr"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-824c9da9928so1623573b3a.3
        for <chrome-platform@lists.linux.dev>; Fri, 20 Mar 2026 01:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773995540; x=1774600340; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nh7FB2+tAnbHPiN9V6sKTsvc+IqdTYaE8U3Ar9OxWRk=;
        b=mrZVJIJr7+unXTXkgkW7Z+G/BR7SUOQqIrtAuMBovR8t1DEvsbOza8J0n9VOhpZc9t
         iJ4s8YVg9vWomgrdWmqZ35PV4+YmDzbFX5axei5vrR4ezW4ywqxUbYYZVopDJejUQauR
         dk4nB092bK+dSklU0cblWyEN0KcqAxNZrgUaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773995540; x=1774600340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Nh7FB2+tAnbHPiN9V6sKTsvc+IqdTYaE8U3Ar9OxWRk=;
        b=oMqBXMXzR5UiGBGIOsOxEScMOvCor5FssW28vwUk18AiyOAAMXtaXwF377ybVh6p/g
         YcTXsJ5NnqAjdC7KwQJ4s4FuJDGYkgJRQn8rFxoYXoiu83RQV+TTkdpz++w7AqvSi+1C
         PhOZp1IacmxYbTiK+nXdmWvfo9pSzuPrUsKRviIroHgtqoAuJkweANFV7bWdBTQgx3jf
         ZWW+YIBcejak9mL0HCeEu/av+bUkCf1A1vGo9ZJWX4vb2zQmgKGe5v2nGESdaWKz1KBm
         cTXmr8+HKA4oAbJomRs96MpQCy3V8PDQ6Xe0rWNZO/Mky1QISdvV71sp76yclekqIN+F
         3irg==
X-Forwarded-Encrypted: i=1; AJvYcCVIVsZP38lbw3nJDWPNWrjo1Xs1UhxRSYojS5BOf+9Mr6xu+Dar6kXGW2IZy3Xl4FU5cYvi3nlRAt91/oCpge4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjNjdoYbuGDGa/aiw06QxIQVwKHRUtdv2ckx3SOORfUqujCRiW
	g+3ugVuUVQmPyAqGZbkqfG2AUCJTk2vAHd1l+GNksCaEeh7p8ZDIHf0rQ7K9BqLsGw==
X-Gm-Gg: ATEYQzxPQvokuqmAp6RRiclVKOMyQbeRwaWL1uByvicJwAwVt959Wa3t8fuEEkD005w
	f5f+DDCwhvbBZcA0K3IDVh3B9x16a6XI9NLLoHmTGN+rQgqv9NZYLvBKlF0PgKKHd4oYZ69YvOV
	1c48Gnz/JgMU4hMqPcbCn2+lF5oa0x6r84UMhd/kEjH9QV4Ddmu3xkzCUh9twGQcNm4fDpVNZaP
	LC8O23FR6xtmrn036BUiOKMC/txJGS3ePP+9yhSSam7cH3NI6y53YmmMCLf5sBkjCKsi8L5fms1
	sPRzAfHtDUQbfqed7QtUW9up9EGAWt/0bxgQ10gy6HnKK7Vj79S+SRcSaSF5/OR/zZZvK2w2KPF
	UBG27z819P6Xx6ZSO3HDfoznBwga8Ihruhj2UC4dkXxHdzMEjfF2FZunmYi7wPZYRKo7hNppcPo
	Xn7ICWcBi2kOm3cvFkQuy80QEI5/5mpMo+ZE7cKuAAT82jXHLP4fzu4pQjLCSTSfsSVObWzhh0r
	e5bcgvP
X-Received: by 2002:a05:6a00:299b:b0:82a:f02:7355 with SMTP id d2e1a72fcca58-82a8c35c866mr1756086b3a.32.1773995540176;
        Fri, 20 Mar 2026 01:32:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b040debf9sm1408816b3a.47.2026.03.20.01.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:32:19 -0700 (PDT)
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
Subject: [PATCH 1/2] regulator: dt-bindings: cros-ec: Add regulator supply
Date: Fri, 20 Mar 2026 16:31:32 +0800
Message-ID: <20260320083135.2455444-2-wenst@chromium.org>
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

Add a property to describe the power supply input.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/regulator/google,cros-ec-regulator.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/google,cros-ec-regulator.yaml b/Documentation/devicetree/bindings/regulator/google,cros-ec-regulator.yaml
index 5a6491a81fda..c2bafbc1e9e1 100644
--- a/Documentation/devicetree/bindings/regulator/google,cros-ec-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/google,cros-ec-regulator.yaml
@@ -24,6 +24,9 @@ properties:
     maxItems: 1
     description: Identifier for the voltage regulator to ChromeOS EC.
 
+  vin-supply:
+    description: Input supply phandle
+
 required:
   - compatible
   - reg
@@ -48,6 +51,7 @@ examples:
                 regulator-min-microvolt = <1800000>;
                 regulator-max-microvolt = <3300000>;
                 reg = <0>;
+                vin-supply = <&pp4200_s5>;
             };
         };
     };
-- 
2.53.0.959.g497ff81fa9-goog

