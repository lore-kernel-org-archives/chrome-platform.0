Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFAD2066EE
	for <chrome-platform@lists.linux.dev>; Fri, 21 Feb 2025 23:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740180693; cv=none; b=kmO/uoQtV3ZbsjATWsdLZxwz2FyUHJhSUfyGBwANf1AnF+obsit2QEHlxYPWAznDW2NQDZEzKahah6TrHtpk7CDK3ZFBIOHgm58aUDrryLhHmkWGHNusR4T6zP5jMf/VOpc47xYJO7tfZksajHJC5P11ZtSRLzOpbnpI+NuHotc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740180693; c=relaxed/simple;
	bh=LsqVGCjtMo5lMpVB8FHpQNoTpKeLzijmuixmRj5EbJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LnLyDAvS/fRfDTPnGnCAibu9IBOp5GhruZsnJxbo0BhUiE/uXYly4cb0NGMFXSW2gqf0lSh3aJckZ8AlIO9iDIezQINkYLGmAwWtqrLN3nDtfRAOrhwYFfURT8GfSQVxUiMTWaZnPzOwFAc5+tVBuviJ0/S0GixPcDK2aaU7Sc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L/I8tg5y; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L/I8tg5y"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-220f048c038so50492345ad.2
        for <chrome-platform@lists.linux.dev>; Fri, 21 Feb 2025 15:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740180691; x=1740785491; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApYHs/n7IfGYX7B4lQQ+p4O3G1a7OCsUKtghlEJmtj4=;
        b=L/I8tg5yN8IBRbqc3a82yOiMUr4YA2BdT7yI7t+0Kwdjf7Ui7r7tJr8qXRMQrINiIA
         NewEV6KKRUrxRJ/W29cr1dAKpHnHXlr2T15r1OyukxktO1XTjhZu68TFzAqdafntmlou
         fGdx7DNOLgmHwE4a2ihOGJATXL7BOu4Y7jacQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740180691; x=1740785491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ApYHs/n7IfGYX7B4lQQ+p4O3G1a7OCsUKtghlEJmtj4=;
        b=RFbe9f7WEbLxPj2tauEwtpwx+ELWBEvhjrpF+aEpXndwlwKBhicih+e7o2Kjrjmkrx
         ahADdmghMbU/W9J7coyht4Lpav8H+rgc2kPhKEPyqCcb6W0YVA4hW3DYpGrFoQuscKeZ
         WmZxpVQ0Zhfj7YM6E+OW/88F2kKTO5I2BzCA9twCUaoau6S+Moud1aRkLgkr5nIYeu5K
         8T3iyf1EmXTC165Nz0yjlAz5DNsOceH7b7dabFnfyVArbr2OPOKMya6Mt0B9cXt8Lt7h
         m9alRB00Fv5sIoIjVV8Hy4iMya9G4F2HvPCb1FusyLQfERUgsUX+4E1GsfO0kQpbIpCQ
         0tiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGdeJkb4/J6KkW5Y79qs4PQCsH/vRgrvaYVbNiaPgibMMwZH4MNgNSiqZVfTzrfYUsa5vw2d1kIFNXflWYdMA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmYS5u4cqvR3Yg2UTGsS0+bxNi+E2z8Hscq6hZEtjYwNTGF7E4
	i4t+uv/0hAmgeEYQX+VQsD89temwaRnG5HiWtXrFgY0YkVvI6hhHgUNq3dNOQA==
X-Gm-Gg: ASbGncvXzqawdJi1ylxdiXYbnulfxnTBebEJE5cqjr5xSK25wGR+fKdA1YsxG2pFlnp
	TbBwvK7QiGpVN11ssiANAK9S6evlnBYYlno4QDhNt1DmuHeSc3fQV0149tnIACaHNfjNP1Isrn5
	pnp4CLwyDo0a1nVDMkX+xRanWoYFCLSEOOFa0oh7EfHXcETasYSFG6zpXHrLtN5kkWT4CCIUfH4
	nbXQHzh+jG3otbqjEHaO9Mo8VN5m98Y8ZxBk6FDjPPup1wB9W/gNWIEf/ByAt9eGy3bzSB8CjYT
	lLboKIIqTCk5gY52IKRlLD8YmFg8PpCxWaaBkFroBGKvVIj4KWfIpaPCfPwbo7J2bg==
X-Google-Smtp-Source: AGHT+IHTYhgMmZwtQMesyuqCsfU3X/GUFToquzYJeUC27Q625wzMr9+Lzr+YQe6mF0JuZ2Y4qKGonQ==
X-Received: by 2002:a17:902:ce05:b0:21f:baa:80c1 with SMTP id d9443c01a7336-2219fff2c88mr84742995ad.53.1740180690972;
        Fri, 21 Feb 2025 15:31:30 -0800 (PST)
Received: from localhost (222.246.125.34.bc.googleusercontent.com. [34.125.246.222])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-220d55b6ab7sm141979245ad.132.2025.02.21.15.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 15:31:24 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	patches@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v4 1/2] dt-bindings: usb: Add binding for ChromeOS Pogo pin keyboard connector
Date: Fri, 21 Feb 2025 15:31:14 -0800
Message-ID: <20250221233120.3596158-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
In-Reply-To: <20250221233120.3596158-1-swboyd@chromium.org>
References: <20250221233120.3596158-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the set of pins used to connect the detachable keyboard on
detachable ChromeOS devices. The set of pins is called the "pogo pins".
It's basically USB 2.0 with an extra pin for base detection. We expect
to find a keyboard on the other side of this connector with a specific
vid/pid, so describe that as a child device at the port of the usb
device connected upstream.

Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: <devicetree@vger.kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../usb/google,usb-pogo-keyboard.yaml         | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/google,usb-pogo-keyboard.yaml

diff --git a/Documentation/devicetree/bindings/usb/google,usb-pogo-keyboard.yaml b/Documentation/devicetree/bindings/usb/google,usb-pogo-keyboard.yaml
new file mode 100644
index 000000000000..053c1cfed6d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/google,usb-pogo-keyboard.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/google,usb-pogo-keyboard.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google USB Pogo Pin Keyboard
+
+maintainers:
+  - Stephen Boyd <swboyd@chromium.org>
+
+description:
+  ChromeOS devices with a detachable keyboard have a set of five pogo pins that
+  are the typical four pins for USB (D+/D-, VBUS, GND) and an extra pin for
+  base detection. The detachable keyboard is a USB device that connects to the
+  four USB pogo pins.
+
+properties:
+  compatible:
+    const: google,usb-pogo-keyboard
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: Connection to USB2 port providing USB HS signals
+    required:
+      - endpoint
+
+patternProperties:
+  '^keyboard@[0-9a-f]{1,2}$':
+    description: The detachable keyboard
+    type: object
+    $ref: /schemas/usb/usb-device.yaml
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - '#address-cells'
+  - '#size-cells'
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    connector {
+      compatible = "google,usb-pogo-keyboard";
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      keyboard@2 {
+        compatible = "usb18d1,504c";
+        reg = <2>;
+      };
+
+      port {
+        pogo_connector_in: endpoint {
+          remote-endpoint = <&usb_hub_dsp3_hs>;
+        };
+      };
+    };
+
+...
-- 
https://chromeos.dev

