Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBFF2E5437
	for <chrome-platform@lists.linux.dev>; Tue, 25 Nov 2025 06:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764053354; cv=none; b=KRp2NJndk5NR3v/uVH7tn1f2S3RehQP5peH1oYlJblGXu17GXvsGHhVflQe7DKgnNJs0/K4jfk6LgOyFNyyizgrqxGTYbqjbei42vy/CpIxcsMSdtNTtnNjCxASHe7FURF29NeZM4kpT5tWxrzEkQVGl5eZRhnKpRy6Wz3FaGjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764053354; c=relaxed/simple;
	bh=rXio99+YvGuyrhKrXNpvTD+TKYC/oil56/4az6zPstM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kCC2ylth3Fi6rHqK3A95S9KVGeClWx50mBW8TygBYL3vnUHwMdJacrqLkjOt1ckru/0xMgcLUxbaWni7ygVFIx3ovlihImiS0wucn9o73TjY7z5NYK4pzEP6ONW79uBwZM6VH47dENbVf/mOGacaDJ5ftknttdQTbHl6c3IKfiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z4Ta+aAW; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z4Ta+aAW"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7bf0ad0cb87so5043593b3a.2
        for <chrome-platform@lists.linux.dev>; Mon, 24 Nov 2025 22:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764053351; x=1764658151; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=88kFkP2tiIFI/W0cIcRfnFOjGOXOrhask+3UfD3dOMc=;
        b=Z4Ta+aAWSPSZ4s/cXQ4bWw0IrLBYis9zyk5D8arTw22R3vw1Ixsj85Ncdov8bE4RnX
         DlGwnBA9tqM3illr6b0ovuvIt2GA4LsEmhicYWgjs0L9sHUBgndF7k7JWFs2NhHKEe53
         awg0PXzg1C1jrpsoHcvXHL+jqMYcI13QjOjN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764053351; x=1764658151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88kFkP2tiIFI/W0cIcRfnFOjGOXOrhask+3UfD3dOMc=;
        b=TDnSrsLNk+CeqzT/sQThAfZ3BCxIwNK3kTgvHtq4wHUVuxG/RE7piHvTDH/ln4BHWu
         8WebKw+9jHBBxagBtY4/4zG9ElbUUvwU/v3Mg+mqC33NMBWH1EHiGKgpZ5c8zt5Xtytm
         eKSi6QES3x0L16056Ie32cLY3MLqXvZepmjeabBA6j/gwBWYdR62EaERzfpx596fa+5E
         CQKmURYqYGlktA2iH46TyUbOWEMPszknvoxPB75o/26sFUyAl8hqlB1S7EH/MP2TD5ua
         QjxJdLeHEcZTYoyEEFuZlPPU5uvavNuHpfLmuoFOMxOh7u2kDZsMKwSS27OLFmiCA1W9
         NT+w==
X-Forwarded-Encrypted: i=1; AJvYcCVFO/NCO1idnYrPWqBCvNAhVTiprP0YrJK0UgJRGqSJwQg9+h/WYoDFG2NwjtvfOwzkPEpAt/KakJ4pJR5ng/c=@lists.linux.dev
X-Gm-Message-State: AOJu0YzW+8LcyU3fPe/G7TmDeaEhOixqWYClHR74kMZEXtRJzpTJ5qj4
	Jp6KQ6qPUIOnRzfYMVVHZagVDMY9C40cQ6y3S3oezAJwGr9cCfI7UbaqZk9dYVL2MA==
X-Gm-Gg: ASbGncuAy2dtOtxYzujBNBQO+q7xX2afLwfOeayHfT3nboKfwNPRWZtQTUeNDJ53sY7
	2/hoPEzvKQ7cdB3db91W9zwoDaOi93ggvF2utmCn5nOvfbte1w+x5nEkeI82iJBwthaZMafSIuV
	tNXeQzysVXzixpiUNEO7RDn/QXp5nGksa0wrzBWHcGstDR7bqp3DBLcsNjpnU4k8Pxkljn+ekU5
	vQNXBWhlZBa+KJPws3D39nvgkzrn28ZoeMDBzqnOfITlsmjYXtr1Pxmrt8xXP2hDwymkI68D+Ff
	tzY919WU/TdnVsyD7WTtMo/qfIhR254Pb5oJzMc+nDKxEATitOVZdxsYBomreqSxuGyXQcXy8UG
	IzRK9MhGeBa2eMpYu4urgCmVPwquasLwJ9+sdwsCDlBy3mFs/xFIAjWVSIRkraGxBUq1gE9c+yX
	ApaEFLQ6Wxn45vHoWqyKuO+3NshTs4zyRhGIZkYoE5MJjaqcaYQ8HDii8130ZMMWmo1mPm
X-Google-Smtp-Source: AGHT+IElth1ajKpACCGhmlgof/CcbLxkdUN0v+MBgrJOs6SF5vNzmM++ExuwEs9TPuCVCvtXkQXH5Q==
X-Received: by 2002:a05:6a00:228a:b0:7aa:a2a8:980f with SMTP id d2e1a72fcca58-7c58db2cd79mr14042173b3a.20.1764053350629;
        Mon, 24 Nov 2025 22:49:10 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:2b48:6622:575f:f283])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed471022sm16853335b3a.21.2025.11.24.22.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 22:49:10 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Julius Werner <jwerner@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: firmware: coreboot: Convert to YAML
Date: Tue, 25 Nov 2025 14:48:49 +0800
Message-ID: <20251125064851.3781993-1-wenst@chromium.org>
X-Mailer: git-send-email 2.52.0.460.gd25c4c69ec-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the existing text binding to YAML.

The description has been change to reflect the possibility of coreboot
inserting the node itself.

The example has been modified to compile and pass validation without
any errors. A comment was added to note what the firmware actually
emits.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/firmware/coreboot.txt | 33 ----------
 .../bindings/firmware/coreboot.yaml           | 60 +++++++++++++++++++
 2 files changed, 60 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/firmware/coreboot.txt
 create mode 100644 Documentation/devicetree/bindings/firmware/coreboot.yaml

diff --git a/Documentation/devicetree/bindings/firmware/coreboot.txt b/Documentation/devicetree/bindings/firmware/coreboot.txt
deleted file mode 100644
index 4c955703cea8..000000000000
--- a/Documentation/devicetree/bindings/firmware/coreboot.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-COREBOOT firmware information
-
-The device tree node to communicate the location of coreboot's memory-resident
-bookkeeping structures to the kernel. Since coreboot itself cannot boot a
-device-tree-based kernel (yet), this node needs to be inserted by a
-second-stage bootloader (a coreboot "payload").
-
-Required properties:
- - compatible: Should be "coreboot"
- - reg: Address and length of the following two memory regions, in order:
-	1.) The coreboot table. This is a list of variable-sized descriptors
-	that contain various compile- and run-time generated firmware
-	parameters. It is identified by the magic string "LBIO" in its first
-	four bytes.
-	See coreboot's src/commonlib/include/commonlib/coreboot_tables.h for
-	details.
-	2.) The CBMEM area. This is a downward-growing memory region used by
-	coreboot to dynamically allocate data structures that remain resident.
-	It may or may not include the coreboot table as one of its members. It
-	is identified by a root node descriptor with the magic number
-	0xc0389481 that resides in the topmost 8 bytes of the area.
-	See coreboot's src/include/imd.h for details.
-
-Example:
-	firmware {
-		ranges;
-
-		coreboot {
-			compatible = "coreboot";
-			reg = <0xfdfea000 0x264>,
-			      <0xfdfea000 0x16000>;
-		}
-	};
diff --git a/Documentation/devicetree/bindings/firmware/coreboot.yaml b/Documentation/devicetree/bindings/firmware/coreboot.yaml
new file mode 100644
index 000000000000..568afd1abb92
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/coreboot.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/coreboot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: COREBOOT firmware information
+
+maintainers:
+  - Julius Werner <jwerner@chromium.org>
+
+description:
+  The device tree node to communicate the location of coreboot's
+  memory-resident bookkeeping structures to the kernel. Coreboot's
+  FIT image payload can insert the node into the device tree. If a
+  second-stage bootloader (a coreboot "payload") is used, then it
+  is responsible for inserting the node.
+
+properties:
+  compatible:
+    const: coreboot
+  reg:
+    description: Address and length of the following two memory regions
+    items:
+      - description:
+          The coreboot table. This is a list of variable-sized descriptors
+          that contain various compile- and run-time generated firmware
+          parameters. It is identified by the magic string "LBIO" in its first
+          four bytes.
+
+          See coreboot's src/commonlib/include/commonlib/coreboot_tables.h for
+          details.
+      - description:
+          The CBMEM area. This is a downward-growing memory region used by
+          coreboot to dynamically allocate data structures that remain resident.
+          It may or may not include the coreboot table as one of its members. It
+          is identified by a root node descriptor with the magic number
+          0xc0389481 that resides in the topmost 8 bytes of the area.
+
+          See coreboot's src/include/imd.h for details.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    firmware {
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        /* Firmware actually emits "coreboot" node without unit name */
+        coreboot@fdfea000 {
+            compatible = "coreboot";
+            reg = <0xfdfea000 0x264>, <0xfdfea000 0x16000>;
+        };
+    };
-- 
2.52.0.460.gd25c4c69ec-goog

