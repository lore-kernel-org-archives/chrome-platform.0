Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB3030E834
	for <chrome-platform@lists.linux.dev>; Mon, 13 Oct 2025 20:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760387659; cv=none; b=RoUpXQqyecFZRBe/owHFfXrDve3ER8lXYcFqTR6M9feTOhbyMm3ICshLCsPXWe3Yz8AyDjeE04mTKEH0/DTSpzeqLu/Tb5RUqHL7C/4DqjchFcmrDRbETK5D4FDn1xIdR7cWch3EItu+aQlqFBvSqGfh0bLhcOoaIsomP6q+5ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760387659; c=relaxed/simple;
	bh=FpQkjfU4TuUbSHTPuiOa8TR8ZPo23HNXZuZYxBTIe80=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e0TUyT1KW3P3iQoBqGMB/JuIK6boI2Wov0c7D2ILsYwY8kBsWtqdGngpDHBWIDP7dmCRgMTniQq/+zjEwNszpMHRG7lETXYSsDj1vdZUAa8+hXbJtXN+7VbkFuu11SqXkWtDHoxX2AuTZwoNLydfxNhnL6XVnfAqEBo6rV1yOIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CMk6+PlK; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CMk6+PlK"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b60992e3b27so8018454a12.3
        for <chrome-platform@lists.linux.dev>; Mon, 13 Oct 2025 13:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760387657; x=1760992457; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=geE3ZI6aoZMvu7ZVVGVVhjF0W7bw8fld1I5WFjkcmTg=;
        b=CMk6+PlKRiWHJP6fcwaF4UsPgL5BCQcVTd9bhhjma8c21bNEQawC0X0eBFxs9lxWZh
         kZjKq2dlfFuD9QhH7Qn5TduBvP0Q3jMCOsj0aIoFVYWG5evUM4e47pV7dUww7hPMA8sQ
         tDwWwJT1+5TAt5VNhkcLugom/JPxKC3a+lv1u9s7rQZ9Uj5mI1onFmPz3TEBi9BgeCFs
         VSFCFX7y0yBGgIb4Y0cDh/nVHzG/vyEzP6mPn84OZJQz1sG2ey2xsi3Rk07c7Isr475u
         iITIdjgJ9rYpWafk9yXFkr9CY2ynY7ilfSAea+e44TJHau2/tVHUVgCVJAfnhDmZhe4A
         WA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760387657; x=1760992457;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=geE3ZI6aoZMvu7ZVVGVVhjF0W7bw8fld1I5WFjkcmTg=;
        b=iPnHyqcbJc0fMVnxWbs0kTtAhjkJRrKq1HdAtE/+RZjTMtvvkQHTthyxg3ydLmJ6td
         0CF3fhm2+XR6ly2ubvklljZ+g+KLui9O7cPwCipoJ9vm5ZukATx7Cs/nmAp+M2zhVlRz
         SeMW3BsERjyvgYDZ6XI0wsGv/a0khhNrOec5P2np8Pvd0wSoc1TJHYSPqixkRdcEOQhW
         oBxrz7vfzO6Tg/yV661Al3GLNL6SB3XtlDGgMaPxeNg1b24UsmtLLtuDxboyJCKk2pPE
         PLqDJ+odbsXHm2WrB2zipcWihrfMrNYyH/qfxzwL+fi624Z9JVpVVcZ06SWWRtbkvdHO
         ahbg==
X-Forwarded-Encrypted: i=1; AJvYcCUiKU43LKekqJ5U/iVMZWgoQxH3G74ddo6qKv6u+O74Mkuv3JI3fnTzxiMML1nzWRQ9bEhoAlL5wTkj5kizrFQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCjv9XuwV0dz0LNma6kHAoq8X42r0ECzsrdKz9EwBEquOf7SB5
	/tpJpypXblo2f8nHV/WbidLKFEI0x8br9pcQOdVcXGHSseplyYhL737NL9t9ppLGaCWpuFIw37p
	jXTgFiQ==
X-Google-Smtp-Source: AGHT+IHSLcx2FbFw92aCVE51awsTSRArhdzaa9CLJzwE77OrgMK6NHBiBJW/QdJrdMrrMLKc0figVP0Nh8E=
X-Received: from pjbsv7.prod.google.com ([2002:a17:90b:5387:b0:33b:51fe:1a7e])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d90:b0:2b7:e136:1f07
 with SMTP id adf61e73a8af0-32da7e23a9amr27740290637.0.1760387656845; Mon, 13
 Oct 2025 13:34:16 -0700 (PDT)
Date: Mon, 13 Oct 2025 20:33:25 +0000
In-Reply-To: <20251013203331.398517-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251013203331.398517-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251013203331.398517-2-jthies@google.com>
Subject: [PATCH v4 1/3] dt-bindings: chrome: Add cros-ec-ucsi compatibility to
 typec binding
From: Jameson Thies <jthies@google.com>
To: dmitry.baryshkov@oss.qualcomm.com, akuchynski@chromium.org, 
	abhishekpandit@chromium.org, krzk+dt@kernel.org, robh@kernel.org, 
	bleung@chromium.org, heikki.krogerus@linux.intel.com, ukaszb@chromium.org, 
	tzungbi@kernel.org
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chrome OS devices with discrete power delivery controllers (PDCs) allow
the host to read port status and control port behavior through a USB
Type-C Connector System Software (UCSI) interface with the embedded
controller (EC). This uses a separate interface driver than other
Chrome OS devices with a Type-C port manager in the EC FW. Those use
a host command interface supported by cros-ec-typec. Add a cros-ec-ucsi
compatibility string to the existing cros-ec-typec binding.

Additionally, update maintainer list to reflect cros-ec-ucsi and
cros-ec-typec driver maintainers.

Signed-off-by: Jameson Thies <jthies@google.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/chrome/google,cros-ec-typec.yaml | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.=
yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
index 9f9816fbecbc..fd1a459879bd 100644
--- a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
+++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
@@ -8,17 +8,28 @@ title: Google Chrome OS EC(Embedded Controller) Type C po=
rt driver.
=20
 maintainers:
   - Benson Leung <bleung@chromium.org>
-  - Prashant Malani <pmalani@chromium.org>
+  - Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
+  - Andrei Kuchynski <akuchynski@chromium.org>
+  - =C5=81ukasz Bartosik <ukaszb@chromium.org>
+  - Jameson Thies <jthies@google.com>
=20
 description:
   Chrome OS devices have an Embedded Controller(EC) which has access to
   Type C port state. This node is intended to allow the host to read and
-  control the Type C ports. The node for this device should be under a
-  cros-ec node like google,cros-ec-spi.
+  control the Type C ports. This binding is compatible with both the
+  cros-ec-typec and cros-ec-ucsi drivers. The cros-ec-typec driver
+  supports the host command interface used by the Chrome OS EC with a
+  built-in Type-C port manager and external Type-C Port Controller
+  (TCPC). The cros-ec-ucsi driver supports the USB Type-C Connector
+  System Software (UCSI) interface used by the Chrome OS EC when the
+  platform has a separate power delivery controller (PDC). The node for
+  this device should be under a cros-ec node like google,cros-ec-spi.
=20
 properties:
   compatible:
-    const: google,cros-ec-typec
+    enum:
+      - google,cros-ec-typec
+      - google,cros-ec-ucsi
=20
   '#address-cells':
     const: 1
--=20
2.51.0.858.gf9c4a03a3a-goog

