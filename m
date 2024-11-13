Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F661442F6
	for <chrome-platform@lists.linux.dev>; Wed, 13 Nov 2024 02:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731465637; cv=none; b=KLP7Nk/CGp2fzG9j6HZ9j9C4vPkxjsslSp9SCTH9O0igsoucbTzgFoolkMjsWWaiyjAtY4CgRujjMyMJ9/8/fH40IhQqHnqPqyiZTsxDW0ywtzpGWUKNn3R8wM+tL4SH3heQCfD8m9t4kjLO25jReIjxoaDz5Z5vb+0BSzmp7Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731465637; c=relaxed/simple;
	bh=8lt7eykDFZw7fIigqij0E5lpK1ubBDThz9WowdmROho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jl8ubSFDzCQ4OEPrUFlN+RGEaK27E0870sEz7ZJcMW0vYyTDlSArpeunvsEHFKToCyPAXuh6TKzsNYbNTFLYmCdWuUKqSXuVgfDkq7JLGIY2DXGGSO27MeHvZT9bGyQRJw2C7RpI8bx93u4zpbrXjB2KZ3BxU6MVtp7ANcgvg8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fjq8/uVI; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fjq8/uVI"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2114214c63eso54350975ad.3
        for <chrome-platform@lists.linux.dev>; Tue, 12 Nov 2024 18:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731465635; x=1732070435; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vjvrd2avQzhgqp6lHzhNNlW4+aoD1gw3mVGy/cwxKNk=;
        b=Fjq8/uVIMewl900tcFSG1d8V4HgcwmSSr6sfKlYBkRbbF3+09dn2uolBTJQjOls71w
         eCAtSnDBbRHCqgsYPQ6oDrsN5Qsjb0kS4M25BDzmxSvMMc9YVdS9gqSY6sJgjU4K+jlq
         bILH/+GQ2J5ybNzJIVxlXkdibbTEG3+hY5Gu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731465635; x=1732070435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vjvrd2avQzhgqp6lHzhNNlW4+aoD1gw3mVGy/cwxKNk=;
        b=qUa8I+tTvQ6HTGFcR+qddsD6zWFkLif5fpMLAmanRMBg+SuRrGGzQMDN/TqGfTsyk6
         yf8Br5xshh4p4+j7glZEdEBt/agDCKRUvHs2DKAhYnofnC/SHZIAqPM1LGPcrTQT7CRp
         GhfUe54jIEiQb939lPKoCYQUh+av5TMpidyomnlUpfjLG67BJh6ui+Rg0dk7KSxn+CjY
         cM/C5QyticWJqVb250XCvI7RKv6kguoJwOCho5EA3abzJ3u1G9oHyXIJfnFD8IDbvxML
         e1Qyv6zCZtCrqnqYegl7KxA72xo6mUc0zS4AtZXt3G2c9nRzmtdFz/3M15XXF5UcNwe+
         KZhg==
X-Forwarded-Encrypted: i=1; AJvYcCUeGYuY4ZAznb5eDBPEX5iXYxhBZI1Ks/5tPrXm7yp+nFNA5XNXDR3qiDPGY6FonXNMHBazcSO2MTepvCmnLNY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWjp3oRW3McY6p2OBQlr4+6uSp1U8odh8oyLCbU2A1jNyR11Ux
	EaCjblxTlQraneSiKqRHmjnUppEXw3IEM532XpX2O4CTOJUZFLPskPACTSmtLQ==
X-Google-Smtp-Source: AGHT+IHe721yXQHCRZeRjkW+n+uLrfYbkZjFfwy3XKSXli/Bjhg1eEXBQdFZlkHS9zXTLG7hxYMmCQ==
X-Received: by 2002:a17:903:1cb:b0:20c:bffe:e1e5 with SMTP id d9443c01a7336-21183521d84mr274072955ad.19.1731465635278;
        Tue, 12 Nov 2024 18:40:35 -0800 (PST)
Received: from lschyi-p920.tpe.corp.google.com ([2401:fa00:1:10:3dd4:86fa:9696:4236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e418d6sm101831325ad.142.2024.11.12.18.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 18:40:34 -0800 (PST)
From: "Sung-Chi, Li" <lschyi@chromium.org>
To: 
Cc: "Sung-Chi, Li" <lschyi@chromium.org>,
	Conor Dooley <conor.dooley@microchip.com>,
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
Subject: [PATCH v3 2/2] dt-bindings: mfd: Add properties for thermal sensor cells
Date: Wed, 13 Nov 2024 10:39:52 +0800
Message-ID: <20241113024000.3327161-2-lschyi@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241113024000.3327161-1-lschyi@chromium.org>
References: <20241111074904.1059268-1-lschyi@chromium.org>
 <20241113024000.3327161-1-lschyi@chromium.org>
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

Signed-off-by: Sung-Chi, Li <lschyi@chromium.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Changes in v2:
   - Add changes for DTS binding.
 Changes in v3:
   - Remove unneeded Change-Id tag in commit message.
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
2.47.0.338.g60cca15819-goog

