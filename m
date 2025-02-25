Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF41218592
	for <chrome-platform@lists.linux.dev>; Tue, 25 Feb 2025 22:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740522644; cv=none; b=dqicQdc6OYhun/57+/Ko8TRpUX13CDjVkMUOs35UUDsulZVH2lqx/a0rj8AQ08lYq3r47RKXCJUcOYIQMCYvUvsUGqGTVD4Uw9Bvu1dDAxaydj3ypnPZlNaZbfMtP/6YBNoRH8BZpGvNsR1jVcweB/KvddlOSeFIzN0mRp/qxRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740522644; c=relaxed/simple;
	bh=LsqVGCjtMo5lMpVB8FHpQNoTpKeLzijmuixmRj5EbJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iGScZVmFJOcglu9OJ5ymLW7JHnCeiDO2akBnM9fr8a8o1bKhla9wDbESZ8MOIeT4zoAXmt/kFrjgJ6FnLI+ZG07yvg4A67JQHYYsYUFSfPvLY9ZSHgdvGLRxYGwGyfCScgDW5+jtW5YoD3V++wh8oXBEDFX7yPWlgPszEnpPJz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d0x/dVbf; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d0x/dVbf"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2230c74c8b6so34958515ad.0
        for <chrome-platform@lists.linux.dev>; Tue, 25 Feb 2025 14:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740522641; x=1741127441; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApYHs/n7IfGYX7B4lQQ+p4O3G1a7OCsUKtghlEJmtj4=;
        b=d0x/dVbfYJJVFiB1zm4TWqwsiHiAMNhFTErnZ3ILiqi35y24yKQBYmodxPsUT2VQ4Y
         LoiF25RTjuzLu1s4v8mTosrqiPRer4FkVfEJI1n8BcXTPDeHmAkNr0qw78/hbAR2mWBr
         /gDghHMpPjh+9kJaO8a0gDXDpj8YqiGrCUbGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740522641; x=1741127441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ApYHs/n7IfGYX7B4lQQ+p4O3G1a7OCsUKtghlEJmtj4=;
        b=T/Ru1zifbieYVX2s35sTRIK+YhAfVTu+olbjIPE9TDFz/4pjt2ZwGUY+bOIKzo3JzN
         e3xiihXf8SS4z32PF81XzLBl4T13zv2eCPWbINvPxN5d5NdV5iFWHrDc6CjEz/RSt34+
         +3jJHuN70SXz+JK1rZphueUJnP02Unn4Vt+YmtnIPKMsoxlw6Rru17e+IL5CE+Um4Oy6
         nBtkGHeJ3FQ0N21X7VPvceiHVJpWwIr4rTtfyI5c+h7RJS4TFuEoWhdVgBRjM+v5L2g4
         sQs/Oi2AZLpAKiw2p1o46nJoMueMP3fC2KNc1P4AsGIJlwnpSla6ID3d9gQOUR1hxNsE
         kDwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqBGftnzmTj9ZnrY/UEr5hcnpSnQZx7aHBSN8fZ5zhkVQHCb++Pc8Lk052Um6O96XQ5bVvY3cNz7cYUZ81Wts=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOeuma0j7qU9C/RniODMwTlrkAj+RTlPnkBfNm0UsKOG+OhAh+
	FOQPZkhDkxEz1/5cYrqxaGFDwZz8VZbGYZF01KppwIX+fBd1juGTTD1QvVeh1A==
X-Gm-Gg: ASbGncuLOb2+Ln6UUHmtR1p1lMMwwlBUQrWGwNkB5lwY68A3j26RD0i09Vr6AXw5C9D
	todzHHYCSbiKN6cQDBIXCcnATTxodGjYR+F4xVAlnkmzB+J+jZHxKGLR/IsrIy2H14oxMear/n+
	altJFiUKuHNTmUsTVoeLQSlbGDK1PR98dUp/iElfgd/ndUTPomi3HOnpDXiNMvGj6np9aBEqKZf
	BSOEw/9UKWQ6wqTW3Trk5VvSK2NjrGJ6/jYljmVVCh+eAqJD7PdUaax3mxX4TaTqGmk0ZJubQRU
	FUXr3FnvoX6OYgfl3NRanbGcDJr4UqxLJTl/SseRcw/wyQWAMEp4ZYcNq0XtzTTyFQ==
X-Google-Smtp-Source: AGHT+IHW1xqPTBE6DlhH45+k6SdX/yDbLaHBxXJlSInk+OwmjcdfQ4C/YpQmsbuuwHQxPH6RrUiRJg==
X-Received: by 2002:a17:902:cf10:b0:215:853d:38 with SMTP id d9443c01a7336-22307b59639mr75965445ad.25.1740522641460;
        Tue, 25 Feb 2025 14:30:41 -0800 (PST)
Received: from localhost (222.246.125.34.bc.googleusercontent.com. [34.125.246.222])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2fe825baa7fsm78653a91.11.2025.02.25.14.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 14:30:41 -0800 (PST)
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
Subject: [PATCH v5 1/2] dt-bindings: usb: Add binding for ChromeOS Pogo pin keyboard connector
Date: Tue, 25 Feb 2025 14:30:36 -0800
Message-ID: <20250225223038.879614-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
In-Reply-To: <20250225223038.879614-1-swboyd@chromium.org>
References: <20250225223038.879614-1-swboyd@chromium.org>
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

