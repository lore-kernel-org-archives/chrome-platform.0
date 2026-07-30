Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3806E3B776F
	for <chrome-platform@lists.linux.dev>; Thu, 30 Jul 2026 20:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785444167; cv=none; b=oG4mZHWooe6pl4apWFTwt9gW9tJ3o02y0CAzqj0MGB53fXBk6z0ljTHAHconvoo00UGIwUkLhmvnMrDPAOBEN/Na0KRx2YlqThqwG9YYf/JPqEgXZr4Eekh/XhnQBkeAqrPhZ1M+bk8VUFvf/ri4KcSAn0l9gDnGnhb2CE3F8gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785444167; c=relaxed/simple;
	bh=/149ulqrcdtaG1qUdORqgl5boYhjb5sdpqdBFYaxZco=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EEEP8VyelnXl6yh112HWlqxY35qGKz/M8w/5+sDoyHKuzAj81S/plur5plt9CGjmWm6r9jWoYKBDh60yp8/OEExpmufasj7kxDSJFJ+tMDvb1LHkh6kFSRVoK0b5U8hQIpjLNp5yYRnf+2TELp9AmuK1lruCbiKnwfixllie2X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--asavery.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yug77SzV; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--asavery.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yug77SzV"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so61633a91.1
        for <chrome-platform@lists.linux.dev>; Thu, 30 Jul 2026 13:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785444162; x=1786048962; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dsByQ0/1OGgzWUns1mhtQVv7r6mgk6SI3CTK7dD+yxA=;
        b=Yug77SzVJRhqycfVoYxJyHJZ7eQhcYGe1HKzyyCLUyPL4a5r27smT7EIV1Dx3CBvII
         j9U7vOAsF2Ru1/wp8PSxRwsBj0q/xl8YyoQB/VzdLBGJ+cyo3v6S3DuSyrS7TarIzIoE
         ALRFYQs7jNOsRkUYcy40nwcvb1NkW6F2NZl7sX6fyOV0uS4xWA05FtssNL/lbdP9bgUA
         h/BJgJ2OU6Rci/iP1NXuZEDHb1BkH3wFQxn1+jMKiNymUySEjLeqJDW8qmbFelPFWSCz
         wzaiczjC6wCLH79eDqmXzZ+0nY7nJZ6TZBX5PtTuJcpXL0gLmq8iHowyYzTDnxOYreMq
         hHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785444162; x=1786048962;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsByQ0/1OGgzWUns1mhtQVv7r6mgk6SI3CTK7dD+yxA=;
        b=kLSbBQHoUz9G+AiioB7SWKfX0mrtfT1xAZW/hwDxc3jaE4vgcMr1wZ4VofOtGt8KjR
         jUm4cdzrGsM7lhocs7DJx89IobW19BIApTq2iJasT0Yvn3CCb/Hd1SawNuKVCx0V2TrU
         MRA0olchxKCZoDsYEeGr9YWzqa+1fbKgMAZHwgzw+/ck9YcCQx2NaA+5BkQb1XzEqwa3
         +aAnq7aeetZLNZRxMYX1xkCrgLVdoOiVSieLvbqlEnRqCyIqgF3ocXyM7/4S5RneHqEb
         Km/BCsxygRc8YoyxZ52z+2LBLskPLfcixQUCD2jX1cEntlkPh+1qtnGbU5iPVPKcy2EX
         IGXw==
X-Gm-Message-State: AOJu0YzOM/VW8r/DcU9HDh4SGV7qg4aB6sfjIGubUdCXQdTn9lKZ/tSl
	QE/M16DawqW+ls5FBCnE0MlwOSRAYkMAqkfULfNsUiCbpqMmjzpo4eLgkCK1V4umBbLSc+8u8ia
	U3yVI0JQhEw==
X-Received: from dlww8.prod.google.com ([2002:a05:7022:ea28:b0:13d:d48:df85])
 (user=asavery job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e18d:b0:366:10f1:3d91
 with SMTP id 98e67ed59e1d1-38f9bd6d1b5mr3694513a91.1.1785444161951; Thu, 30
 Jul 2026 13:42:41 -0700 (PDT)
Date: Thu, 30 Jul 2026 13:42:40 -0700
In-Reply-To: <20260729221459.1006-1-asavery@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260729221459.1006-1-asavery@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260730204240.2227178-1-asavery@google.com>
Subject: [PATCH v4] platform/chrome: lightbar: Limit payload to max packet size
From: Alexis Savery <asavery@google.com>
To: tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev, asavery@google.com
Content-Type: text/plain; charset="UTF-8"

The LIGHTBAR_CMD_SET_PROGRAM_EX command encapsulates its payload data
with an 8-bit size field `uint8_t size` and is natively capped by the V3
packet bounds limit array `EC_LPC_HOST_PACKET_SIZE`. However, the driver
currently allows the payload chunk to bypass this protocol limit if the
SPI transmission layer negotiates a larger physical `max_request`.

When this occurs, large payloads (e.g., >255 bytes) integer wrap the
8-bit size variable when assigning `param->set_program_ex.size`, causing
truncation and parse failures downstream in the EC firmware stack.

This change clamps max_size systematically using the maximum structural
type boundary of the size variable, bringing chunking in sync with the
hardware limitations without artificially binding to a specific protocol.

Link: https://lore.kernel.org/r/20260730005956.559287-1-asavery@google.com
Signed-off-by: Alexis Savery <asavery@google.com>
---
 drivers/platform/chrome/cros_ec_lightbar.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
index 02a6c34e68e6..c9740a3bb5a1 100644
--- a/drivers/platform/chrome/cros_ec_lightbar.c
+++ b/drivers/platform/chrome/cros_ec_lightbar.c
@@ -496,9 +496,14 @@ static ssize_t program_store(struct device *dev, struct device_attribute *attr,
 			return -EINVAL;
 		}
 	} else {
+		/*
+		 * Bound the payload strictly by the maximum value the structural
+		 * size field can natively support.
+		 */
 		extra_bytes = offsetof(typeof(*param), set_program_ex) +
 			sizeof(param->set_program_ex);
-		max_size = ec->ec_dev->max_request - extra_bytes;
+		max_size = min_t(size_t, ec->ec_dev->max_request - extra_bytes,
+				 type_max(typeof(param->set_program_ex.size)));
 	}
 
 	msg = alloc_lightbar_cmd_msg(ec);
-- 
2.55.0.508.g3f0d502094-goog

