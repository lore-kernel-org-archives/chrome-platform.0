Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992284;
	b=MFBG5HRg7VKSK/raR9uwIkKt+sFjDJr9xHid7pJr4xEBc5z7pD+g0ajEJ75itHUKdT5w
	 KT2Jv9VLr+BPxniJjfWe1QWprD2AigXFgjzolDul4awq1FlKYLiuTYl0MfVrnDKwQ4o49
	 LYSNacwoBcs/JxbA+2IVMOhNY1R/KvXq/L4RezDWZAyB50/r97b7RsTFse4ap8jE9eQdU
	 HQ7RxEo4+W/EYtJBuHpV0XKG3SsPUwEN4oW9B64GmP654kJAopXKy2l43I5Ffm3ySQZYN
	 EHcrLuNST/B0N8W4mgK8v96uvDSK1T8TarJ2y0m6oaQzWBxo1IgrSOhwR5O6JBQ5LJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992284;
	h=DMARC-Filter:DKIM-Signature:Cc:X-Original-From:X-Lms-Return-Path:
	 Content-Type:To:Message-Id:Mime-Version:Content-Transfer-Encoding:
	 Date:In-Reply-To:References:From:Subject:X-Mailer:Received;
	bh=mejuaNi7Gw6EMtifS+cvih2W/toAxrfb+yYMr1OlBcE=;
	b=Sll0QtHoHAxTFflPMkWUMwiWNuNCgEkntTTY6SIROJdTcmB5NOjugEzlOhL/DVtcNxsR
	 wbQYfG5ub7Py7LthrEhU14UaOqCB1gTJif3vGLwbj3pdLLoDT66wHJ9YS1qgEm7pE6euH
	 StLGnCldzmS7fWjZQ0sXqv6HYapL+sVjmqfoYteEY4lTNg/1SVKIb2PWqbeV8Xd8qEZ29
	 QlCujHnp9hkTQqRdL2NoJobHGIrpLDXlkrXAD8KDPuxVwL2MwHZop/IRPuX+vWHbnREpy
	 OM+6JhkkCG0WTfOEeYGuM1+JPG8h8pmPwsPVPEzhl8M9Ad9mfLEAbWYuOwPYATV9ABw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=W3KJI4dt;
	arc=none smtp.remote-ip=209.127.231.16
Received: from va-2-16.ptr.blmpb.com (va-2-16.ptr.blmpb.com [209.127.231.16])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBB5606A337
	for <chrome-platform@lists.linux.dev>; Wed, 18 Nov 2026 08:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EBB5606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=W3KJI4dt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794992279;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=mejuaNi7Gw6EMtifS+cvih2W/toAxrfb+yYMr1OlBcE=;
 b=W3KJI4dt12NsUYzCAdgeohCA9vyFB/YXik/TdOlMOKiDjf8JfaoMKoM3YmvgJQY2JAJUSg
 brJ3Es/WE+/2mUQn45fWVcWpGLaNIGzw9qZ7QAPTx9tws8qanIBS8YChikDOzMLQkNWpir
 5qri5Q6bZuRGhSP8fJhOr9dsAtuJDpJhoJCDR56+nHyEo/efXbpUA/MLnpq9ZhFGcNTERL
 hA7BpGwynA5ZIQa5TlZN39Q7rVgzTeTmMVdRZOpdUm/jCs09vSSrOMV/xrH0+zMhXNB1LP
 rMqFM+EqJlX6br28FCmHvYfOwDOq8CyQ+2/v4t+3crzN3VtsEOnzr4IV9FnyDg==
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
X-Lms-Return-Path: <lba+26afd6895+8481e3+lists.linux.dev+yang.wang@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
To: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>
Message-Id: <20261118085742.1817536-3-yang.wang@deepcomputing.io>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 18 Nov 2026 16:57:35 +0800
In-Reply-To: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
From: "Wang Yang" <yang.wang@deepcomputing.io>
Subject: [PATCH 2/9] dt-bindings: embedded-controller: Add SpacemiT K3 EC window
X-Mailer: git-send-email 2.43.0
Received: from ubuntu.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Wed, 18 Nov 2026 16:57:56 +0800

Describe the K3-specific non-linear peripheral window in a vendor
binding. Reuse the existing EC keyboard schema and keep the Google EC
binding unchanged. Point the vendor controller child schema at this
binding.

Signed-off-by: Wang Yang <yang.wang@deepcomputing.io>
---
 .../bindings/bus/spacemit,k3-espi.yaml        |  2 +-
 .../spacemit,k3-cros-ec.yaml                  | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/spacemit,k3-cros-ec.yaml

diff --git a/Documentation/devicetree/bindings/bus/spacemit,k3-espi.yaml b/Documentation/devicetree/bindings/bus/spacemit,k3-espi.yaml
index 30985ee0a..545cc2609 100644
--- a/Documentation/devicetree/bindings/bus/spacemit,k3-espi.yaml
+++ b/Documentation/devicetree/bindings/bus/spacemit,k3-espi.yaml
@@ -112,7 +112,7 @@ properties:
 
 patternProperties:
   '^ec@[0-9a-f]+$':
-    $ref: /schemas/embedded-controller/google,cros-ec.yaml#
+    $ref: /schemas/embedded-controller/spacemit,k3-cros-ec.yaml#
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/embedded-controller/spacemit,k3-cros-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/spacemit,k3-cros-ec.yaml
new file mode 100644
index 000000000..971e7b32d
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/spacemit,k3-cros-ec.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/spacemit,k3-cros-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ChromeOS EC on the SpacemiT K3 peripheral window
+
+maintainers:
+  - Wang Yang <yang.wang@deepcomputing.io>
+
+description: |
+  The embedded controller implements ChromeOS EC host commands through the
+  memory-mapped peripheral window of the SpacemiT K3 eSPI controller. The
+  window uses a non-linear LPC register layout. Offset 0x00 provides host
+  command writes and status reads; offset 0x01 provides host data/results.
+  Protocol v2 arguments and parameters are at 0x10 and 0x18, protocol v3
+  packets at 0x100, and the EC memory map at 0x200. This programming interface
+  is distinct from an EC connected to an ordinary SPI controller.
+
+properties:
+  compatible:
+    const: spacemit,k3-cros-ec
+
+  reg:
+    maxItems: 1
+    description: EC peripheral memory window, at least 0x300 bytes.
+
+  interrupts:
+    maxItems: 1
+
+  wakeup-source: true
+
+  keyboard-controller:
+    $ref: /schemas/input/google,cros-ec-keyb.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    bus {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        ec@0 {
+            compatible = "spacemit,k3-cros-ec";
+            reg = <0x0 0x1000>;
+            interrupt-parent = <&gpio>;
+            interrupts = <1 11 IRQ_TYPE_EDGE_RISING>;
+        };
+    };
-- 
2.43.0
