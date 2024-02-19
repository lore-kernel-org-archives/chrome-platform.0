Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F33535DE
	for <chrome-platform@lists.linux.dev>; Mon, 19 Feb 2024 20:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708374214; cv=none; b=SA5BrH/he53kl74Wa08nCdEvjdNWsCYiVsOJdxA3Xdh+ipNG67arzBTku88OEMl0Pw3a+6kEiYZkozgGD9SLa1L/5L1YQWnfok2ivhi7UigvNG9B6fIE7iWVDADxs9r8xED34PW9J7aaZZg64/YnCspTOhRwpBpzW24ng3Ww9Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708374214; c=relaxed/simple;
	bh=GCN4a3XwyVGjN4FSoVSL7WZNZKmZBWlauyy+D84PGEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hAAT1JwDdcmrDNHso+olqSIPfJw3aDY4uPhl/FoF6/O7ymNO3hbd5EpDewgoo7BqrtSXe04XxEoXTyxBXrSvoPbVlyDc09KV6TbPk8x/lwHTuEWxg3DLyhJ9aPxYhVJyIwLR/06CrVsr6pB8T2ro3U5fyiSeVBXTbF17Ep+hLYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mxqaoEqh; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mxqaoEqh"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dbae7b8ff2so14904605ad.3
        for <chrome-platform@lists.linux.dev>; Mon, 19 Feb 2024 12:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708374210; x=1708979010; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kUa3JH16Oe5UJV9UEwjr6pY+WpID6lK8xSe+O5n7a8M=;
        b=mxqaoEqhUck79Z7mWhqu8ZeIeZVubplEohsUhC2/48JldFPuAkTNyUZK567kT0e6bj
         25RhVtqrAh5jeIZdoklyuQIyqj+oev67vzK+iXOhzYoLG3AB/fD5u6FIm4O45ZxL1Wdk
         vQtflXcS8EvelF+FWCI7NxjLeJPAGbqVBkE9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708374210; x=1708979010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kUa3JH16Oe5UJV9UEwjr6pY+WpID6lK8xSe+O5n7a8M=;
        b=GmiXcaMJVv87rcGrHjGLspsuLHcX7hqn1+jUlhNQBWsAhL0avhlwjApz3rCkr1Clmv
         ZGzSGreSuFSMDWrS1fzS788ALpxHCtSNnsaGn6nl0HfYfxqfAekgQt3tKgoEOFVzI8Sg
         skxFreNLEFBe8G/61H7kwJSH54RImtj0I4UdiKiNcDsh0hu+4VqjPh1kEiGAcPrXUkD3
         SZSoHNBNrWO+qv2VFgQ/0ASVR6lQvfAZYa0bk6N+fhITq5Psvc3DbnPP+4/lRPYhxUBe
         48rmByUItdyf0I50JvYjS+tJdVYIqKLl/TpMFnQbm0MCL1RMdh4y53J9vfpYspnJ94y1
         Gkdw==
X-Forwarded-Encrypted: i=1; AJvYcCWhLmaUpFF6aT8+2SrMnbLMCWOCqCHyja2h+TucqD1VavJ45jG4Lo/2+k/PBkL9nnklCjgVXubiVbRIyrFEl3FREY/yik99DbkCqKzp51Lz
X-Gm-Message-State: AOJu0YzFjnNYTyAi00G/jS8O5HHwPO9nPANPHK9Vo5rNrB35b9tpmMGC
	TBskkJ/I6gBBx9oHuopBuEwMBRyJqXH9Jy44yJnEtpm/J8p53hlynJbmWOIYpw==
X-Google-Smtp-Source: AGHT+IG8LtaETDPpup4Qyvx26INSaCWovgahZdaA0zbKl+GL/t4KUJJLp2AnURqkSJ5Jxmv9EMKmoQ==
X-Received: by 2002:a17:902:da87:b0:1d9:2158:1308 with SMTP id j7-20020a170902da8700b001d921581308mr16281281plx.28.1708374210688;
        Mon, 19 Feb 2024 12:23:30 -0800 (PST)
Received: from localhost (175.199.125.34.bc.googleusercontent.com. [34.125.199.175])
        by smtp.gmail.com with UTF8SMTPSA id mf8-20020a170902fc8800b001d9fc6cb5f2sm4818207plb.203.2024.02.19.12.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 12:23:30 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Douglas Anderson <dianders@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Subject: [PATCH 1/2] dt-bindings: cros-ec: Add properties for GPIO controller
Date: Mon, 19 Feb 2024 12:23:23 -0800
Message-ID: <20240219202325.4095816-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
In-Reply-To: <20240219202325.4095816-1-swboyd@chromium.org>
References: <20240219202325.4095816-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ChromeOS embedded controller (EC) supports setting the state of
GPIOs when the system is unlocked, and getting the state of GPIOs in all
cases. The GPIOs are on the EC itself, so the EC acts similar to a GPIO
expander. Add the #gpio-cells and gpio-controller properties to the
cros-ec binding so that other devices described in DT can get the GPIOs
on the EC.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Lee Jones <lee@kernel.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: <devicetree@vger.kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index e1ca4f297c6d..aac8819bd00b 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -93,6 +93,11 @@ properties:
   '#size-cells':
     const: 0
 
+  '#gpio-cells':
+    const: 2
+
+  gpio-controller: true
+
   typec:
     $ref: /schemas/chrome/google,cros-ec-typec.yaml#
 
@@ -275,6 +280,8 @@ examples:
             interrupts = <99 0>;
             interrupt-parent = <&gpio7>;
             spi-max-frequency = <5000000>;
+            #gpio-cells = <2>;
+            gpio-controller;
 
             proximity {
                 compatible = "google,cros-ec-mkbp-proximity";
-- 
https://chromeos.dev

