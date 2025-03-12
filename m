Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1491D1EC012
	for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 20:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741809617; cv=none; b=Rv03XIhZti6EIS+vb399U6qTHAaKEWLCchBCn6OtMCSh9UsLc4a2w8eOtPp75KsJN3NlC8fw31/z//BnZUI6nXtASP9/66cg3hIlr9SQA2Nf5hAqPoJ2SXFykiUtj0qFgKBmArjcTuNgptcEZcdgnoD8ePLGtLr3TkhACNxpurM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741809617; c=relaxed/simple;
	bh=WvRKKyrxPM0AndWhf5s5lTyd+m2bVCqjFHn7YN0dKLs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mE7eYI418e8rezSkvi68F2zZ1YPHPrmPQwkOgCQ+LtSFhiroB/oW6e/Ek+EpWh8ZNytbZZ/Dl0ZaRlDliE/JROGRopL8P6qbreHWuhtxO0AWb9h4N/xMvqCSF5QPnC9+T8Df3tbZameAIPQ3kEdZe5EaLE5n1lv2GZcMu+7wAUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FkNTLdjx; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FkNTLdjx"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff798e8c3bso392193a91.2
        for <chrome-platform@lists.linux.dev>; Wed, 12 Mar 2025 13:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741809614; x=1742414414; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfELBOAwKsIn4f/h6RBx4PQYztLIiCjc1rnfMpVEC8A=;
        b=FkNTLdjxs0yjzGIZLNPBhrf4kv2QC3nhWFE6vKOMZZOENRa00pmJ4V0p+oOJCzmPEr
         oy14WNvkpsOT+s5TDwQnRfy91gaXdLnhsaTJ0kmGOL9/qc/FXifUORd4xTmRDxIeUXxj
         2gI3Juvx2btQ+546Mp/B9SMjTxVZKAtksf/U/aJcBBPJD7IFq7uH3DE+Aitbfx6JvVWj
         ZuxxarVEMSqJl+Zwez8jhuyo+BwMf1fxcgRH8U+I2yNwAECuT7WnfnxbjOTap6Lc77C/
         ORK9RdvZETLSNru0cC507sDl7bP9B50nTjYp+3TgEbfO8QACjd/M0YFUIJa+KRkyGoAh
         Aeiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809614; x=1742414414;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wfELBOAwKsIn4f/h6RBx4PQYztLIiCjc1rnfMpVEC8A=;
        b=W3uJQnxvIlpH4LOBaHq/mUJH5+sjUwABPcgnYip0lw8mNCmjg/2dAol0AYjx7ynQ/z
         9614wCdWUe56IYQRjP5eDoJjevy/WytjYqys92j/GVg3R8XBlwrVttuQlEBuET8Xg+ty
         6XApQPgedImdUgpfmeX3MDM5bIOPCghp48OG/Youm7cisRvpTa919eZSXDuHDXQrdBKk
         d2cJBhfrQxyIUVq8akFsWjOw00XH6k032XjQRBcFXRl206rTK6J6YlXnYsFQB4VDqGna
         0otBzWi6ncK+AD/BALvHiIMLPdMK8hJWuCLzVNNWbq3jZUQxWeruZC4RN3GZpj/W5Ek7
         1F1A==
X-Forwarded-Encrypted: i=1; AJvYcCXVU2p6B8tYSyiKqO5KnG41plUGDplH6lk595c6Xp5/vUBUGKXv7EnwSyVSby4v7zlqNxVgg9EWpqXj4xNSoDU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTjr9BfbHV08CRG4wB/KVlICLMC5U95Gn9m0Qoc/HZrxedJsC5
	9dDwxd8eJD8CXaVB1/+42bhRsKWrV+3dArq2L2a4NH6P4gboQh1+0nRm+fII5bv6V409B9YcV1+
	Mcg==
X-Google-Smtp-Source: AGHT+IE+MbUq96ItG8DzcFSeVabSk7TgmT8HCVRXFsqek/lzPUV/vp4+cJRf1j5i4c+BNQLVVm3ovOJuqD0=
X-Received: from pgbfm12.prod.google.com ([2002:a05:6a02:498c:b0:ad5:2dcc:552b])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:c79a:b0:1f5:8126:8a5d
 with SMTP id adf61e73a8af0-1f581268cd8mr18624416637.17.1741809614269; Wed, 12
 Mar 2025 13:00:14 -0700 (PDT)
Date: Wed, 12 Mar 2025 19:59:10 +0000
In-Reply-To: <20250312195951.1579682-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250312195951.1579682-1-jthies@google.com>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250312195951.1579682-2-jthies@google.com>
Subject: [PATCH v1 1/3] dt-bindings: Add cros-ec-ucsi to cros-ec-typec device
 tree documentation
From: Jameson Thies <jthies@google.com>
To: tzungbi@kernel.org, ukaszb@chromium.org, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, groeck@chromium.org, swboyd@chromium.org, 
	akuchynski@chromium.org
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable

Add documentation for the cros-ec-ucsi device tree definition. Defining
this node will load the cros_ec_ucsi driver which is used for USB-C port
control on PDC based ChromeOS systems. Additionally, update mantainers
list to reflect changes to the ChromeOS USB owners.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 .../bindings/chrome/google,cros-ec-typec.yaml       | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.=
yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
index 9f9816fbecbc..ab39c5280681 100644
--- a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
+++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
@@ -8,17 +8,24 @@ title: Google Chrome OS EC(Embedded Controller) Type C po=
rt driver.
=20
 maintainers:
   - Benson Leung <bleung@chromium.org>
-  - Prashant Malani <pmalani@chromium.org>
+  - Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
+  - =C5=81ukasz Bartosik <ukaszb@chromium.org>
+  - Jameson Thies <jthies@google.com>
+  - Andrei Kuchynski <akuchynski@chromium.org>
=20
 description:
   Chrome OS devices have an Embedded Controller(EC) which has access to
   Type C port state. This node is intended to allow the host to read and
   control the Type C ports. The node for this device should be under a
-  cros-ec node like google,cros-ec-spi.
+  cros-ec node like google,cros-ec-spi. On TCPC systems, ChromeOS should
+  use cros-ec-typec. On PDC systems, ChromeOS should use cros-ec-ucsi.
=20
 properties:
   compatible:
-    const: google,cros-ec-typec
+    oneOf:
+      - items:
+          - const: google,cros-ec-typec
+          - const: google,cros-ec-ucsi
=20
   '#address-cells':
     const: 1
--=20
2.49.0.rc0.332.g42c0ae87b1-goog

