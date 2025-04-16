Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4C317A31E
	for <chrome-platform@lists.linux.dev>; Wed, 16 Apr 2025 00:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744761740; cv=none; b=OOUTsicnB11bFwjsT5FpJW1m7gMfcuCjvz2ec4htuhjuW4USodstQwTeQA0Lu5sw6bCZ8AL9tPh4pv2UVoEAaAxBMAQSAQpLbhsXkF61m1YBdVCSIzw/OH7N0+hmuZID4lOR5XfuMgzmaGAGFvhQOSOqDpNBVgZVCSneI2XKfzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744761740; c=relaxed/simple;
	bh=prSaVLEnAK+vncf8usI+ZxASfQG4nPOuCBOY+Y2RjLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cCD/A5l6R9y2ZPoUjutWJcyN84a/DTEv9JUx1EnqbI2bAJ7rIE/3ODOfzNwcWqtJ8gzMirEiKaiWdfpQHmAhh6XgEkWSrQRpmq3u6bu7INcQfosu0izxZ7xYK5fFRwQmBKboXbU0IbOg4A1p7svx/AOs+OvNltEvxikQk6/WnLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RXHMRVAE; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RXHMRVAE"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-af52a624283so169879a12.0
        for <chrome-platform@lists.linux.dev>; Tue, 15 Apr 2025 17:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744761738; x=1745366538; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYGM0h7RhBS79sRo31i/Eh5uWT+nxNBuyvsqtZ/CclU=;
        b=RXHMRVAEVNdPXIwjaNdG1pySxdDHtgd2KiAYBbcDxrva9vyx+1LdQHcpVs0M1p3O2P
         sx0ICip8aZFK9fIisQNPFTroHeqDhyHHvVQpeotPtmHOK9zUbtjqeqTAkedScdL3OC5U
         /F/s0tVHQ1fJu733333UGyi6Wm+u5K9WgkUoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744761738; x=1745366538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KYGM0h7RhBS79sRo31i/Eh5uWT+nxNBuyvsqtZ/CclU=;
        b=kOp9uR+WiPCpDNDTs9Qfvb1j69LnuLR87c0zb98NcLD8Er5oDFNQPn297IyHbKgYkg
         RDJmCM967V2E3Edjh8LvkHegYRt9Fd5o7+DJFk/JeTSZ41jiYtPNOn2K3H3SiI2dBlbh
         qJK5yySAqXl5/KIyKo0ZQzvq8ChmcRyR9nCxDBb4SbytPfJ6mpfwKT5O3VCVs6M1b2Ag
         FVTpbu3BknJ1R2fNuKqwsQgfdJMbuWhP+njKPZ/ehUz3qgbX3L6BgMmfPqapSek48ELF
         8LugSg2Vl3RWDhPvcSW9G4vwU2y3bQX9E5NcxiCq4UGWilltS4ieEK+UUvJD+/VMjtpo
         rITQ==
X-Forwarded-Encrypted: i=1; AJvYcCWerDiEtlTH1oW3SVOI9oPZuxjnyRehQIFleus//r+14u+eBG35kun5fjjonai58fpCI8bq9P3g+MXxP+t8vLA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+EfvU5YUifv49v53xAKMhkhfYmlPsgEzL1vYi7w6174Zk29v0
	tI2WI0KyyQxgYyf10nkuFYRf3elgTrzEG467vwOwpaf2iMXRAcAr+bLMJzn/4A==
X-Gm-Gg: ASbGnct26D4szm23KBJhUlWBabTlljKY90bcjv+IEwzz4V4+U81JHi9zMr2r+qh57da
	o7zcKUsvwfz+0VlbDlrUJvrlxXAjfhjFTPfdw8MZZL29aZrUzKwxXtH4rfcibEGfSu2e4BELOCu
	8c2JC3FZMRxvNHoHmKibdcMek7lsg02FSd/7U3IDklZ3X2vzHKD0xJ1jDExcFW537Y9tMkdd1C5
	NKDmXOgHj7yDREQZlpkQc5KRnCymGYjlSn2V+/wOQWxc5k92OovzmnqUZ5srwnYSxyGS6rJm7rA
	4JyrmyQEApXuAZp9VrnaX5oK0SadCFFmcuEeNv2a4bfK2doSvpZs1SSNU5c77vfM9jzEqCn0s7U
	BOQ==
X-Google-Smtp-Source: AGHT+IEOM8kY/Swx09k+WNyJ/f38PKBMBA/O7hhf0bPsaN2iBD0xvwXHaD7iBXxxmNY494s22DK7cg==
X-Received: by 2002:a17:90b:2e41:b0:2ee:9661:eafb with SMTP id 98e67ed59e1d1-3085dfaceecmr2050851a91.12.1744761738388;
        Tue, 15 Apr 2025 17:02:18 -0700 (PDT)
Received: from localhost (199.24.125.34.bc.googleusercontent.com. [34.125.24.199])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22c33fe4de0sm1234335ad.212.2025.04.15.17.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 17:02:17 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Pin-yen Lin <treapking@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/7] dt-bindings: Move google,cros-ec-typec binding to usb
Date: Tue, 15 Apr 2025 17:02:04 -0700
Message-ID: <20250416000208.3568635-5-swboyd@chromium.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
In-Reply-To: <20250416000208.3568635-1-swboyd@chromium.org>
References: <20250416000208.3568635-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This binding is about USB type-c control. Move the binding to the usb
directory as it's a better home than chrome.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Lee Jones <lee@kernel.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <devicetree@vger.kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Łukasz Bartosik <ukaszb@chromium.org>
Cc: Jameson Thies <jthies@google.com>
Cc: Andrei Kuchynski <akuchynski@chromium.org>
Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../devicetree/bindings/mfd/google,cros-ec.yaml      |  2 +-
 .../{chrome => usb}/google,cros-ec-typec.yaml        | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename Documentation/devicetree/bindings/{chrome => usb}/google,cros-ec-typec.yaml (72%)

diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index 50f457090066..ac89696fa649 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -99,7 +99,7 @@ properties:
   gpio-controller: true
 
   typec:
-    $ref: /schemas/chrome/google,cros-ec-typec.yaml#
+    $ref: /schemas/usb/google,cros-ec-typec.yaml#
 
   ec-pwm:
     $ref: /schemas/pwm/google,cros-ec-pwm.yaml#
diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml b/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
similarity index 72%
rename from Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
rename to Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
index 9f9816fbecbc..3272d0e01f7e 100644
--- a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
+++ b/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
@@ -1,20 +1,20 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/chrome/google,cros-ec-typec.yaml#
+$id: http://devicetree.org/schemas/usb/google,cros-ec-typec.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Google Chrome OS EC(Embedded Controller) Type C port driver.
+title: Google ChromeOS EC (Embedded Controller) USB Type-C Port Manager
 
 maintainers:
   - Benson Leung <bleung@chromium.org>
   - Prashant Malani <pmalani@chromium.org>
 
 description:
-  Chrome OS devices have an Embedded Controller(EC) which has access to
-  Type C port state. This node is intended to allow the host to read and
-  control the Type C ports. The node for this device should be under a
-  cros-ec node like google,cros-ec-spi.
+  Chrome OS devices have an Embedded Controller (EC) which has access to
+  USB Type-C port state. This node is intended to allow the host to read and
+  control the Type-C ports. The node for this device should be under a
+  cros-ec node with a compatible like "google,cros-ec-spi".
 
 properties:
   compatible:
-- 
https://chromeos.dev

