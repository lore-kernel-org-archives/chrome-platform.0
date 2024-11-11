Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CAE158214
	for <chrome-platform@lists.linux.dev>; Mon, 11 Nov 2024 09:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731318685; cv=none; b=Q62HTwIX94WqEV69Dspx+/YS69LBvoJq9ewTR9ZCJnLxAxLxb4KsYxke7zVwrBnh2P16YMGZL6uQK5NosQHZLE5i8nfJhDhjmrTr4M1Go8lKbMmn1Vm6+aRQfrcKXc6bktfBGtXNYmxT8iE1q+5Czzd6tQx7vYfYe2PU+6mgl+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731318685; c=relaxed/simple;
	bh=FAFR0+tSOv4I8gRENdRAuULdCjfZHDr1M0BGBxx8hmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rW13RpSpNyXqPyLVjq1res507iGF+UnY3GSbaaw/Y+ZlNeir3rtdXlweoP19TvwzH9tgdqWKKj/0p3U9jb5RAtrHZfeRpJE6IdHBN6p9S09deXiBmDHf7y4x1ql8KlYas7bIIw3oIierZ2vLr1qPqak8d16FFB9Pp0PPEtj9gdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SZg8qTyF; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SZg8qTyF"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3e60825aa26so2542616b6e.1
        for <chrome-platform@lists.linux.dev>; Mon, 11 Nov 2024 01:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731318683; x=1731923483; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=guSru76DQNk4jTAiYkWrlXoJU1Cr/ZCthqHp1IjuiWw=;
        b=SZg8qTyFsn5WhblavSpaAq9lWms7LV840EoY/00vcEV0Nkwj9TOH9ISf0CyCv4DfBB
         S1YWZ56Bp1TgxnqfRk3Umr2Q2WwY7t39TpFQOAc35t0G2YjdNL7S9eMU7JG2wjvArlmZ
         pJTz81BjMy0zFJLhWtqWTF49OI048izJSu76A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731318683; x=1731923483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=guSru76DQNk4jTAiYkWrlXoJU1Cr/ZCthqHp1IjuiWw=;
        b=Gzw5Dn8NlwirP7nfyJwJLSxHUrDKxzIT9OsHoAvLicpwN+guOdvv/Eu3Vbs9UIO5Y2
         QfLelNjmr521fcJl6Q+nr5bKb87xy9Wu4cgevMiNVLD1xYeZfkFo11ecgHFUiterqGAh
         ITMICvC/gqMlQt2Q6pSBCSC4LG7Q4qEYED8f0qFU3BZzG+2jJUMGJ0SG2caGcLlOIiPq
         5rx1lRG4WVNChDpJPigEF2mmnPKChvabKI+ofv0JYthyfORDgtJWkS59r5npwRDxVjaR
         JWXimG/WfQzIQQ7ktFky3wUK8b/ykXbaoK85fBf1Agd8f0pMIBe7ysWt2RF2jO6ff310
         L3mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOT+7/+ff2tGI2PUvFsiuN0Lv0wzsjZzuToIL4V+3Ij17UGi6rOkuyJKUioEcWE6TfL2iyj1oV/qWJI7K/hkc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzeYlE5pvO0hEoaPCFuA2Rri3+6w/1ffkwnCIAemEwlqxTSjM5D
	PwbCgC3h+po7mStG795Ymh03MvPeugYyBug/y6BBk297FxxnVp2LmjkGrqfiIA==
X-Google-Smtp-Source: AGHT+IG0E+pWn2Nhc1Tx7OrG49FBDcEDXCgNq4jPe83YpmSRM4g+0j589dM2a8bt6edqHtXly6EVuA==
X-Received: by 2002:a05:6808:1a01:b0:3e6:5908:1776 with SMTP id 5614622812f47-3e7946952camr11345320b6e.15.1731318682973;
        Mon, 11 Nov 2024 01:51:22 -0800 (PST)
Received: from lschyi-p920.tpe.corp.google.com ([2401:fa00:1:10:ec9f:d26:733c:7acf])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f5b48c6sm8075164a12.18.2024.11.11.01.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 01:51:22 -0800 (PST)
From: Sung-Chi <lschyi@chromium.org>
To: 
Cc: Sung-Chi <lschyi@chromium.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: mfd: Add properties for thermal sensor cells
Date: Mon, 11 Nov 2024 17:50:31 +0800
Message-ID: <20241111095045.1218986-2-lschyi@chromium.org>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
In-Reply-To: <20241111095045.1218986-1-lschyi@chromium.org>
References: <20241111074904.1059268-1-lschyi@chromium.org>
 <20241111095045.1218986-1-lschyi@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cros_ec supports reading thermal values from thermal sensors
connect to it. Add the property '#thermal-sensor-cells' bindings, such
that thermal framework can recognize cros_ec as a valid thermal device.

Change-Id: I95a22c0f1a69de547fede5f0f9c43cbd60820789
Signed-off-by: Sung-Chi <lschyi@chromium.org>
---
 Changes in v2:
   - Add changes for DTS binding.
---
 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index aac8819bd00b..c7d63e3aacd2 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -96,6 +96,9 @@ properties:
   '#gpio-cells':
     const: 2
 
+  '#thermal-sensor-cells':
+    const: 1
+
   gpio-controller: true
 
   typec:
-- 
2.47.0.277.g8800431eea-goog

