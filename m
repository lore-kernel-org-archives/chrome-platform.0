Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ADC25A2A0
	for <chrome-platform@lists.linux.dev>; Mon, 10 Feb 2025 22:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739228239; cv=none; b=uf455vULSZDhQwii85bKrk90GSIOMHrniGsWg2yVlbXNXQSf6SpfWrUpK/bnmUsH06k8TZa5eq3zBKOd5h9kasB6mHdqn0KdWNYYd5GvX9OU45j6q3ELV2uPkcta7h6Gzhd4h/hYeI8qXELqfJzJqoq3g601zy6PUjh4HPNg3Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739228239; c=relaxed/simple;
	bh=TigOjWjByS/qOxFStuN4jxQdOoIMiI/Kd8fVikyy1TM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XbDfAVDyjLnwhKKVrDZnTo77QC7niTLun7Feezytd/2RDfNAtTIbGxI62tFI4gbiWRVNCTYUOSBBBCuch4zCsL9KGp6SQDMpD7IxRs00e1Uz6JyeHUcr87XjW58d2eJ1HbRFR5u2d6HqCp4sblxd92V+G7MPCfgjANGgAn50das=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OMmunEvq; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OMmunEvq"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21f40deb941so102667965ad.2
        for <chrome-platform@lists.linux.dev>; Mon, 10 Feb 2025 14:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739228237; x=1739833037; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZJsAaQGNn6Yx+uv7DpUfzz85gmu7DiYTeAAhcXBbX4=;
        b=OMmunEvqnWelyEV05ayn2xGTdmrjdOWtvXPb3mCFkkhUQ7nXjgsTIOmBLGWbzycSfF
         L4t7giYbSqwDynYDMF0F7g9EO7dnL5AxtlW6wCt/REZuSTvcuDknNzFSOXcvhWdWKIns
         jiLTXaAyQ8T7O8Noz8qmKas1Jbw6u2K5c2j7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739228237; x=1739833037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZJsAaQGNn6Yx+uv7DpUfzz85gmu7DiYTeAAhcXBbX4=;
        b=NS0l69dueHixYyn4Y2M3JPYIRvsVh8ZtfHM1jKmRklOAkIxkygh0fr/voQfveQdrOY
         0hDSSnP8qztJbifEYBP2A93LyaS6PV9J9oYK96XwqlQS9aE01SG45CAuqeC+dvCjc7aD
         myyMg6XWa62Cf7M2NbDs/dyF4+j8GnoyXlLMb6xJCay3pkJNAiD3ivL4DrlMbQFylQZG
         bPvkz1nh/hb3UF4OaEkiDlBms4vfrPCboCJF/cysKtZSq1dV5swsxDZBeg3Rnn8Ri/MQ
         wnK8AYRX8c8DqwjNLFq5DI9s8BSgyMxvKM9IwCHZMi46Wgw76mNyhvBXEjCxa3xZ19Xg
         Gb6A==
X-Forwarded-Encrypted: i=1; AJvYcCWPyAePUvXXV7NHRLn+E2Ib3CHc89mJLJOoT9jmXYpVB3NLvYFoZp3tI1Bph7NNRAAhhJkTGhwbuMoS+NU11NE=@lists.linux.dev
X-Gm-Message-State: AOJu0YypgpgEvFBfb9HdcN7tK/cZILT+4hd4Wr0tWOx7Tmz/Rfgs0Z9l
	a0NkhtvAeyhq0e4HZ5iaUO5m0MquBGxtcBYnf/KN6LFPDQh/cNbBVhq81FXNqQ==
X-Gm-Gg: ASbGncsj9ATX8y7NvGvvrf3k6O04Jn9EfU8+2MsPZOLUfOrUq5olcw2hBuiUXGfWZ8+
	IRALURRgq/grMNghtqxUpJuF7kQKKLsN6NN5mWfksEIiujqX1GluOX10c9zZYuWXdcKYOhXEDpd
	j4JUSBd9hKz5Hn/1UG+4oTox+Q4cou2++vpUaRV+lMyPuE3/qJlY6P78I3g+R0TrsDnTX26sSh1
	EvULl79+wiCSOjV/Yg83YOhMFJQay2KrPqFkbG4i0x4y7adgMprRW3FJxnZpW6ce+SJZLHd9uKJ
	LV74EeXZ98RdEPFLo1ZO7HJNXnZFAefjQh4W457yitpxVVZ5hZbXh8c=
X-Google-Smtp-Source: AGHT+IGZ3N+kY02h1wIak+gBqbJaa+gpVr6uo4aUlKJT3x7EaQ/2I7u1jOu0/8aGMau+q+PMMuwGiA==
X-Received: by 2002:a05:6a00:1798:b0:730:8e97:bd74 with SMTP id d2e1a72fcca58-7308e97c379mr8317065b3a.2.1739228236978;
        Mon, 10 Feb 2025 14:57:16 -0800 (PST)
Received: from localhost (222.246.125.34.bc.googleusercontent.com. [34.125.246.222])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-730840e842bsm3436416b3a.88.2025.02.10.14.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 14:57:16 -0800 (PST)
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
Subject: [PATCH v3 1/2] dt-bindings: usb: Add binding for ChromeOS Pogo pin keyboard connector
Date: Mon, 10 Feb 2025 14:57:11 -0800
Message-ID: <20250210225714.1073618-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
In-Reply-To: <20250210225714.1073618-1-swboyd@chromium.org>
References: <20250210225714.1073618-1-swboyd@chromium.org>
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
index 000000000000..e1b3b2c1711e
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
+  "^keyboard@[0-9a-f]{1,2}$":
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

