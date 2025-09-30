Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD09E1E5B63
	for <chrome-platform@lists.linux.dev>; Tue, 30 Sep 2025 01:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759195467; cv=none; b=snFQ+BMhlbiDQkn88RSFyvbEyI8jnyTPVMe/bChiftTp/8FogiBzi1hhEmsD8vRRmyN0KdEe9zLAMaPc80TkR1wj6TeZiR+UE+uCnbOiZBLTIHmy91SJGNxavVL7EcxEA8ihAvNyplFiKJJ0ABLX9rMIEju0XGev3YhA1pultx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759195467; c=relaxed/simple;
	bh=K/Ast7zI4CBJT0EMM1Wyl6eslOV+td2jx96m2YIfAWY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NwC3XMMzvkr1V2+VX/EFyv5jVTnRWCMqymlkWGe0U6t+0Rxt5Lr+9qHzNGJxgSIm0CyZrv6mLNMf/KIhHqp8PuhRixCQhBHkcQzGa0mxPoanv2WAeJcNIudg/NgU3ErQHnluhDunSgOKbXfefL6bHduaNZmOx/EdjjJ/7+MI9kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AJOclFcL; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AJOclFcL"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-27356178876so41878735ad.1
        for <chrome-platform@lists.linux.dev>; Mon, 29 Sep 2025 18:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759195465; x=1759800265; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqKmfga5+DprzT5XPy4gegnRDxSvFLR2QAkxrjqmzq8=;
        b=AJOclFcLDOYpEJ9KZxXQ57gA6NB77ockKFecSN4tv8YQtn3B2DWjs5WWKdg01hB5wB
         F/KNUjmSRYJTTxhOt5SvDTvNn2OSdPtaqycyALPnG/3ZX84iBO/G/Wyh24Ps+e3ehnPa
         ey9rHQt2zxReUfbpTO0m5KiTf5PHi49jAR+f8xxNQrjzQCHUQBPyRgJ30KfF+ugZI5Px
         rizu1NfKNxXLZz9ME6IqQZKQJ6AzI4wPfuX97DgOQ+uR04wBhb084ZUpA/JY610GwWx7
         oWPm19IREYzpLuQr8sHRZYmKiGCLFIEEbOuJr/7cGWmYHpj4gb9wN/ypQpDpY7jafCka
         cDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759195465; x=1759800265;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aqKmfga5+DprzT5XPy4gegnRDxSvFLR2QAkxrjqmzq8=;
        b=TZUjhR6NFD18iPwox90XYNcrAUHyQoitahHftsCPH/eFvbxt7ywdcoGdOrtkMSxmgX
         jo/iMqDGnRKO25zw4gfh9MV61kdDqG+ZQ2gMe+OqR4KaCdwJb34RIMCTmbJ8LXtkvU8z
         yDwdLbKyNvDgxnSrpY0wgW6T9IycBKlgUNszEc7VNhYtNRFsBPmIjUIGZAQQXoY6AhB1
         Cd+rnZWiz/iMgSqaMjvBXRAd20omAFGiqO5Io5qYkL+Crn3KssSY+6IFqwB3akWPCkn3
         F8hH3O1ZAKP2SzKAHZA1jx3FiPhhEQRjjeW7i7xnI0BI4bVAQlWgOniJs+pynG+bnE/s
         Vo2w==
X-Forwarded-Encrypted: i=1; AJvYcCVoJfi9qiJ8/3LC0kK42HJu8zFbaxzZ0YPpHHRROZrNFqn9EuvAOQqYm/H7u8vC4hNw6XDQ8mQLnahS2jYSg7E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3iG0pvDvXVHe/ZG3xADpay1IOhWy3Kd+LnMAqQIOlRuI7L5H3
	4SWUvFZyRGd8tKgCCTFxVy14eu31D1lzVrOn1jrQuc0tqcr7qrFBDhJtnfK7hpUygZr3o4xer+s
	yiasfGQ==
X-Google-Smtp-Source: AGHT+IEp3ni/J2850XF1SC8Da4jAYRKJ8zaTUNw+gIGy76wXxB5yLFx3I78wqin08hufNLQBk+qUDJPhQio=
X-Received: from plpk18.prod.google.com ([2002:a17:903:3db2:b0:261:6462:787])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e945:b0:27e:f018:d2fb
 with SMTP id d9443c01a7336-27ef018d516mr153000195ad.6.1759195464977; Mon, 29
 Sep 2025 18:24:24 -0700 (PDT)
Date: Tue, 30 Sep 2025 01:23:46 +0000
In-Reply-To: <20250930012352.413066-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250930012352.413066-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.570.gb178f27e6d-goog
Message-ID: <20250930012352.413066-2-jthies@google.com>
Subject: [PATCH v1 1/3] dt-bindings: chrome: Add Cros EC UCSI driver
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
 1 file changed, 71 insertions(+)
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
--=20
2.51.0.570.gb178f27e6d-goog

