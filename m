Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793993577;
	b=rp2pEha7591UtkNG02peJ6Sig4JhckCeQew46Q8phZMapOpqWM8n7cLy26+HJEuCjfsl
	 LF8uuZp+gEtIA5P9oRxdzL93wHeFgCHUocs9g8kH+ZMFvDXvA9v0V6U0JlsI9ePlmUBZs
	 z2ieKopxhDKvKR44KyOTMu1eeR8rXHe1ozDnfsHKCeNtz2pDjesiX63imSqMakBtDBvXP
	 NQQE9/3BFZVa8NuU0o6rO9LaRGAmfPt0Da0DFh+ssxn1S30IVwyrkE/tMvnN/LqR4QbAU
	 8aA9gkGVhe40eayvc2BjRm8hQkgu6LmJNeZwgdF0ZPoxhSXpZ3nzjAJoDERS1tUQQFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=eV00qevpiw0uwOmkgJzGcKtSnafIzvVPxNUpPKZUN5Q=;
	b=HPdaa9G44vbAn7Zu/AbF8R8yxs+wxo1Po8Sv8Z4Q9z8tct2fjxTkjIQJwQQ37bTpLvia
	 PxG0hdAl3eylH2k9ZSCNpRUK8EtVQpmLgbCX8DH8/8MBi4l/LxG8YTesfZ0rmu4I8HPPv
	 vgiV4h1cs5kODcEjkFQ3BgLJOZTOBBTw4AJ7UZrCDee00uHwfGCS0ZyAZSPPTdF/m5s6M
	 XhhydgIOfMC02rHuaxaBZHeGtCh/Y0sfRLRv+u0KejD9wbBZok41le/2loYYv6DnsVpef
	 ViwcWlgaexLfPjFf3SDABqNNh10xOwscxGZ5b7XrB5md3hr8VTLTALfddiqe2p8BOkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DLgHzuRA;
	arc=none smtp.remote-ip=209.85.167.70
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD34E606D803
	for <chrome-platform@lists.linux.dev>; Fri,  6 Nov 2026 19:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD34E606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DLgHzuRA
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5ba44170027so674444e87.0
        for <chrome-platform@lists.linux.dev>; Fri, 06 Nov 2026 11:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793993575; x=1794598375; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eV00qevpiw0uwOmkgJzGcKtSnafIzvVPxNUpPKZUN5Q=;
        b=DLgHzuRAGcygIGwCYn4wsa11ZgFz5bChHHOX89apLMvC243DpoXKss3TVdXDc7vGXv
         a1Bu/mB6ifiIKr2d3NnLKJwmeUgm+Ftg3AB/qhwi4VVaxF3bTjq5b7u2Ze3kPPyAUQOJ
         1pu1fnWo0OgNfnGSaIbSOWKiLTZtW1NZyXMYjBrvjKKFSSSPP00B8ROoW2DyrU1pTAUR
         vUz/tNhopCbUA7Y98ZAOokpn/HwnO6UkjGdyU7OxZ0hihU6YZT38VjZTp33pmYUVVUKo
         B0lC13J4YDrWM9GYQ+xiUD/RGuUSwoiVUKCghEgwMSgtTX+CJgff90H4lK4lYg0V4B1r
         2DRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993575; x=1794598375;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eV00qevpiw0uwOmkgJzGcKtSnafIzvVPxNUpPKZUN5Q=;
        b=UK9DQ21i558JTEGVYdkS2lENvM0APCKBPLTAQT2HR0OHQsgdju7jQOgAkg5V1yNa5V
         jhka7Wj+cV6VuQSNB9WFww1/gd35T1KHpEZwOkUS2mShsFi0gKzRdgNtnXJOH1YgZoI5
         50l6zLpVj7DEb/gQxL1uNgCJz1e5U5RuqIH+tceHNQhol3m4V+5J4Qh90EcLFXVFeOHv
         kfUgom75SV1u2X8sPsS6y49h01WRrG9xcU3v6FgH6m8TYv+pv8Sj7CUOS4Amx28z8IO3
         70xn3huR4ksec9BB0WDPv+ZUDbGqT8UoKyNXreuV+dVCNWAbJgxgB9WYcQO/C4j72VfN
         362Q==
X-Forwarded-Encrypted: i=1; AL+hErHpwn6LNFC1sMnqR6n41cTP5o/XcY+hxTJFJVXmR5AaMVayUCfOjKr5RlVs93Ys2wtmZ6pwpmc+rGIubUpunBU=@lists.linux.dev
X-Gm-Message-State: APuU4Z/356QjjM6i3k+0XS8ACDdLUuVVLMrCUAbONqJEdrbQk+A6o09d
	uKY6ttIMHmFJlMsmUU44ag+85ArTdr4Dy5j9xkTwr3+Gm8WWL/otUQu+yWD4cIyn2K+3UaxdFLW
	lmPQeTjZMVw==
X-Received: from lfyy9-n1.prod.google.com ([2002:a05:6512:609:10b0:5bf:f63a:785d])
 (user=dbalint job=prod-delivery.src-stubby-dispatcher) by 2002:ac2:4c4c:0:b0:5bf:c9c7:eae2
 with SMTP id 2adb3069b0e04-5c003c595e7mr1028653e87.66.1793993574941; Fri, 06
 Nov 2026 11:32:54 -0800 (PST)
Date: Fri,  6 Nov 2026 19:31:17 +0000
In-Reply-To: <20261106193129.43493-1-dbalint@google.com>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261106193129.43493-1-dbalint@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106193129.43493-4-dbalint@google.com>
Subject: [PATCH v1 3/3] mfd: cros_ec: load cros_ec_pwrmon on supported ECs
From: Daniel Balint <dbalint@google.com>
To: Jonathan Cameron <jic23@kernel.org>, Benson Leung <bleung@chromium.org>, Lee Jones <lee@kernel.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Daniel Balint <dbalint@google.com>
Content-Type: text/plain; charset="UTF-8"

Load cros_ec_pwrmon driver when the ChromeOS EC advertises
EC_FEATURE_PWRMON.

Signed-off-by: Daniel Balint <dbalint@google.com>
---
 drivers/mfd/cros_ec_dev.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 529a23b804f7..9cf85636b7f9 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -115,6 +115,10 @@ static const struct mfd_cell cros_ec_charge_control_cells[] = {
 	{ .name = "cros-charge-control", },
 };
 
+static const struct mfd_cell cros_ec_pwrmon_cells[] = {
+	{ .name = "cros-ec-pwrmon", },
+};
+
 static const struct cros_feature_to_cells cros_subdevices[] = {
 	{
 		.id		= EC_FEATURE_CEC,
@@ -151,6 +155,11 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
 		.mfd_cells	= cros_ec_charge_control_cells,
 		.num_cells	= ARRAY_SIZE(cros_ec_charge_control_cells),
 	},
+	{
+		.id		= EC_FEATURE_PWRMON,
+		.mfd_cells	= cros_ec_pwrmon_cells,
+		.num_cells	= ARRAY_SIZE(cros_ec_pwrmon_cells),
+	},
 };
 
 static const struct mfd_cell cros_ec_platform_cells[] = {
-- 
2.56.0.455.g6c5a503b38-goog

