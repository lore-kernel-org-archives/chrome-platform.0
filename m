Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D45335966
	for <chrome-platform@lists.linux.dev>; Thu,  9 Oct 2025 01:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759971801; cv=none; b=gwVzdOM7XIdjouzumoeH4nQBZC/FnAT1ilghZ02WT8xlOY80qWvKe+AY9W9/bw+xFLNkqYI2hmQVfzblVwm9xSZegwJh2g7oZyaPlAwiYjQpwuH1Dl1Xk2E5L7k2veQKHjxO+n15yTSSoDe7fth6aDjPXFeqPK7Cx7VMvTPOMZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759971801; c=relaxed/simple;
	bh=FdWz06FUR8AR1uAl3wTfj9n2BioEbn7zOnkyos3KuZY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WxrQ1foflFiiTJobtCSW62qc9IMrpIO+Y3c0zsvqUP5m0Mp4Mbd1w24HfD/cjUzYeSpWU3YLsIVrMSEIhSOG1z0k2gMbBnxZgtVmyIz4jyHpmKGQQvhtRmlLd8QN6NQvK/7gF+OIlYX45k767w8Rk2F+62lbvNaiy3riSD1pRbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PQSb/hnK; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PQSb/hnK"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-28eb14e3cafso12156815ad.1
        for <chrome-platform@lists.linux.dev>; Wed, 08 Oct 2025 18:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759971799; x=1760576599; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9PK081DUWtNx4HfeEFM5F2Wg1a6MRRDecC9Tgqx96lM=;
        b=PQSb/hnKlPaE528FJkjm8jWxr3rR3e+hdv/nHX4JPTwjdwRXpLUNt2k2svqGTV/qSB
         TLQaBVkanwJB/xOQ05Es0LI4DKMDcGsZWfeA30T55fKjtJ1Zv/ns2fw0S9FsN49hzTVr
         VNcdl+nxg6J++b7HlbgQ2rIEQy869EX2t2unFmrWTt1AnbBjxLkhL8Dhc0TSjbB/FsE9
         l9fhJuX1YIxvQwEeSFpGAgUSGsbIDrn3uYyUm+66iOrUEvkQURq2H1PxmtHA3eKnWUbv
         nRWtyPCbTuByWptb32g7jvNA+MOrtJtKRMZgzPN1kszvMF2CJz7dwuwrxkCwghLSnWw0
         udkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759971799; x=1760576599;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9PK081DUWtNx4HfeEFM5F2Wg1a6MRRDecC9Tgqx96lM=;
        b=Pa99xY55pNQ5qu7itk8vkmSlrQ+DBXy4waLCc9NIJDWpoBja4eCSBDyjveTF+MIYp8
         eMMQWHGMEalCAg7kJvh10c30ii/U3Mlr5x48C1Y6H4DB9VJ+whB9kFmjAOz5L7zBQ0GT
         A6tmSZCpvynVbRedbY1VwX4euLe+jl2LDN3btR5UBgIIaW2ylayl17Wcfx2mAN7q37zR
         uZdmUoqthIVSGTIqlwWaUxD+O4RQl/1dbT2pOmwxL35pS/+DI5n4nhKa5QBFscT05Cu+
         ht8XCU1duJdBNbOTbNo2CHQY1FYDwb/CHzrhKXEUi1pCXyrzkZ3diOamZ3aPGoCEtLQe
         /Xtg==
X-Forwarded-Encrypted: i=1; AJvYcCWKfkifmbWVfr1sK9A/And1xuvXBXRYqs6O0TQOQmln70grsFFLTWSesTwmscDwWoaMKJEj7LA3tn16n4PBvjo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxktVcnhw7XbXb9VIvpThBCfIRWKxpmoBZF8Q4Qk9CAhH+Tqwsj
	Z8GuMilQ9WxoFKZQmY5KInIVPQXc2v3mhJwRbtSntymHQ1oXxvV9VNNW3bFPCZVOQZkQxw2kHRY
	81a25LA==
X-Google-Smtp-Source: AGHT+IF6Ef5HS/jsjPnjXWi2U116WXq2EAEcLkV6Ztc8hjYkYYaXlariTxuV8NKw8zY9XwFYXy1JjMx6vIg=
X-Received: from plnq5.prod.google.com ([2002:a17:902:f785:b0:267:ddd1:bc97])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3c4d:b0:267:44e6:11d3
 with SMTP id d9443c01a7336-29027379986mr72867335ad.21.1759971799367; Wed, 08
 Oct 2025 18:03:19 -0700 (PDT)
Date: Thu,  9 Oct 2025 01:03:06 +0000
In-Reply-To: <20251009010312.2203812-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251009010312.2203812-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251009010312.2203812-2-jthies@google.com>
Subject: [PATCH v3 1/3] dt-bindings: chrome: Add cros-ec-ucsi compatibility to
 typec binding
From: Jameson Thies <jthies@google.com>
To: akuchynski@chromium.org, abhishekpandit@chromium.org, krzk+dt@kernel.org, 
	robh@kernel.org, bleung@chromium.org, heikki.krogerus@linux.intel.com, 
	ukaszb@chromium.org, tzungbi@kernel.org
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
2.51.0.710.ga91ca5db03-goog

