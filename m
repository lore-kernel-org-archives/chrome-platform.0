Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AE02D8365
	for <chrome-platform@lists.linux.dev>; Wed,  1 Oct 2025 19:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759347238; cv=none; b=c/nybD0ubiLnsZcw1PNqeMeItnf2qx+H9o+nSW7/qDgyWOUTXA2fn5lS3ZcoiIEiuTL/Hc6hfAvzBfm9sDAE+DQTN7OixgO/Piu1JPnLlgxmCmKvvP+uJJpZkSnmPnw096OP//IO8rSy7Xr5tcXxn6Li9Rp3rR7Na2jOF/53LuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759347238; c=relaxed/simple;
	bh=FEpg/7BZxeu5NgwiYBv2Ee+RYqZ1LN0sPgk+srr05OA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fxMCrdIUeWXgmM72vjqCByTH/ym+X2LlH11q9eV5jDzl7ch0vZGbApYgtfZ6mRcst0WQNqNP1AtVw0sdnlVB+BHF/8lAxGYKT09roz6qdIszTYbruR171+YJcxVk1KSvyb/sGRiw4bBKypse6kFV6EdJFM8boSBFAVPywoVLpL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=007Dx6ib; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="007Dx6ib"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2681623f927so1253735ad.0
        for <chrome-platform@lists.linux.dev>; Wed, 01 Oct 2025 12:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759347235; x=1759952035; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KOZcKUaQjl52TKTb2c8zMCvsKmsV/y/lPeyOuQ6q8ow=;
        b=007Dx6ibnk4XmI/d+VYkSvn9n3hY2arFwo+JuPZhBN94z3p5yGaSCD3vjoYjZ4LTMM
         n6OtDS+8MzIhJHcPqWsnFJXQEtBsik/JM8Ba3wmNS5Jfl1dFvgXObVO6Ezt23/8M6R9D
         W8Zii4n67neaHkSB5VPAhf+V3lY5O2eJmIbRweQcXnvzwhfh1eOxU/3gxK6HXaKo8kd7
         X8ac6RKQa93O7czFXnG2FTKEhiRH+hApp/LcRgB9eRdi+NV0eRDyq/M20sRC+aPlTf+x
         mOK38PPJsWrps2sy3UTt+IbAlKoG4eOSttxXFc6C5HnT62s6rOfAQePgGlfGvuy5uVcp
         YWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759347235; x=1759952035;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KOZcKUaQjl52TKTb2c8zMCvsKmsV/y/lPeyOuQ6q8ow=;
        b=gOxe6mHRmMKj19Yx6H81TlNRH+fHSSGfbw+FWqZzCE/JmoSmwJUuY9eWzPAttAl73T
         e0HlgJtaWxpjo2ss678O2nUEE33QNLG4x/+H7jEekKeSRdmozrdNn8y33UJld8GZ+FsH
         09BUW6bqHuMlOIXJGNrNLT1xjfn+Pv+tCrtf/pfelqYP6aas9JX6KOAGrSk53dBFJN8y
         cBbaQACYLMvzRf5J68RSfvPzXIzqg3EBdHMa+8VP986v1IY3HEmJSL0yev25jY5aux8D
         i96wEkrSCl57Obn4/cLoY2pwbuYmXt3im9xJAcgmnTnDPR49uOYwtANr6kBEqgNdMTUW
         jtNg==
X-Forwarded-Encrypted: i=1; AJvYcCUf1dtx/JLzvsZ8BqLQJzA+GmIjcsxJgXCYjXqOc5NZz/V8Irz9hcBcZJl0AIKrp83bFa94xhYwkN2ZBDm14rw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9eGzX0B95NirBV/Fe2u2Y8N2h/6ct8B5tsZe9PGVoJjGtt6/i
	jaliyQlAbepvsA27iqxbNGhKOI+D3w0zinAQvtTnvSIJd7ee77CgwxcB5gbo13huyEWc89EcuQw
	39q9teQ==
X-Google-Smtp-Source: AGHT+IFYeUo9ghhsjfaPnkIvUWWb4I4GUIwXFFyCVFrvfzUwD+cx16qLBp9A0yGOlezJ5enJQwgNYB7XxzE=
X-Received: from plblb8.prod.google.com ([2002:a17:902:fa48:b0:24c:7829:4af6])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2446:b0:274:3db8:e755
 with SMTP id d9443c01a7336-28e7f2f7565mr44337445ad.30.1759347234575; Wed, 01
 Oct 2025 12:33:54 -0700 (PDT)
Date: Wed,  1 Oct 2025 19:33:41 +0000
In-Reply-To: <20251001193346.1724998-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251001193346.1724998-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001193346.1724998-2-jthies@google.com>
Subject: [PATCH v2 1/3] dt-bindings: chrome: Add Cros EC UCSI driver
From: Jameson Thies <jthies@google.com>
To: akuchynski@chromium.org, abhishekpandit@chromium.org, krzk+dt@kernel.org, 
	robh@kernel.org, bleung@chromium.org, heikki.krogerus@linux.intel.com, 
	ukaszb@chromium.org, tzungbi@kernel.org
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chrome OS devices with PDCs allow the host to read port status and
control port behavior with UCSI commands sent to the embedded controller
(EC). Add documentation for cros-ec-ucsi node which loads the Chrome OS
UCSI driver.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 .../bindings/chrome/google,cros-ec-ucsi.yaml  | 71 +++++++++++++++++++
 .../bindings/mfd/google,cros-ec.yaml          |  4 +-
 2 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/chrome/google,cros-ec=
-ucsi.yaml

diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-ucsi.y=
aml b/Documentation/devicetree/bindings/chrome/google,cros-ec-ucsi.yaml
new file mode 100644
index 000000000000..2121776e3ff0
--- /dev/null
+++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-ucsi.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/chrome/google,cros-ec-ucsi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Chrome OS EC(Embedded Controller) UCSI driver.
+
+maintainers:
+  - Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
+  - Andrei Kuchynski <akuchynski@chromium.org>
+  - Benson Leung <bleung@chromium.org>
+  - Jameson Thies <jthies@google.com>
+  - =C5=81ukasz Bartosik <ukaszb@chromium.org>
+
+description:
+  Chrome OS devices with PDC-based USB-C ports expose a UCSI interface
+  from the Embedded Controller (EC) which allows the host to request
+  port state and control limited port behavior (DR/PR swap). This node
+  allows the host UCSI driver to send and receive UCSI commands to a
+  Chrome OS EC. The node for this device should be under a cros-ec node
+  like google,cros-ec-spi.
+
+properties:
+  compatible:
+    const: google,cros-ec-ucsi
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^connector@[0-9a-f]+$':
+    $ref: /schemas/connector/usb-connector.yaml#
+    required:
+      - reg
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |+
+    spi {
+      #address-cells =3D <1>;
+      #size-cells =3D <0>;
+
+      cros_ec: ec@0 {
+        compatible =3D "google,cros-ec-spi";
+        reg =3D <0>;
+        interrupts =3D <35 0>;
+
+        typec {
+          compatible =3D "google,cros-ec-ucsi";
+
+          #address-cells =3D <1>;
+          #size-cells =3D <0>;
+
+          connector@0 {
+            compatible =3D "usb-c-connector";
+            reg =3D <0>;
+            power-role =3D "dual";
+            data-role =3D "dual";
+            try-power-role =3D "source";
+          };
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Do=
cumentation/devicetree/bindings/mfd/google,cros-ec.yaml
index 50f457090066..646bc81c526f 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -99,7 +99,9 @@ properties:
   gpio-controller: true
=20
   typec:
-    $ref: /schemas/chrome/google,cros-ec-typec.yaml#
+    oneOf:
+      - $ref: /schemas/chrome/google,cros-ec-typec.yaml#
+      - $ref: /schemas/chrome/google,cros-ec-ucsi.yaml#
=20
   ec-pwm:
     $ref: /schemas/pwm/google,cros-ec-pwm.yaml#
--=20
2.51.0.618.g983fd99d29-goog

