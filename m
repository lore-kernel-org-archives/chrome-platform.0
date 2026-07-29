Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EECE3E763E
	for <chrome-platform@lists.linux.dev>; Wed, 29 Jul 2026 22:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785363302; cv=none; b=R4uehesFEqiCaZz3dvaUN2w8kjn1PpW6nZ+7NoRY4Ewx01xe/73Q9Rj0tuqBUtksCHgrutdBcJlj2NIMF+Uryc3IIw6YGYMYym9obqWTGKePGHgq71Fz65xj+IptI5yuroyDdqB1gkJ+Lj3+XCjD5sj+5B83gJUHSfWpLdlvu/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785363302; c=relaxed/simple;
	bh=AvcDFLb7CADMaQdQk0ZVCYVX0ZeMhoHZuZJ3cDgGBRE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=DgPmSoaPApGD14ZuZavBFqXvAPF+429ZlDpMVZgqFSCxML69VZG2jIWkgtMKxEuPhN9bdOfHNrfI+731aEMQPEQXJ9OC2FhoLYQEBYi7H9JvahMNvzxcqRyKzkiiAs3oD5Osw3hXYhIXnHuYbr3n+BO3iuvkCSO1aSQtHO4APBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--asavery.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rMbD3ImS; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--asavery.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rMbD3ImS"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so294139a91.1
        for <chrome-platform@lists.linux.dev>; Wed, 29 Jul 2026 15:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785363301; x=1785968101; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9+pHOSPaCeM0QIhBWgFWRt9ApyE24b2tyIl3LwMdDZA=;
        b=rMbD3ImS/rBw2/xq7N4ZxZfZFVpXCP8Q1cW8Z8jlrYpqjW0hnPDQdL5PKMw4nQXpPV
         Q12+j7v3QOoAGTRIMmRP65DvxY8Ls1bpDF/OaCFYEqqRNhJLMa6OeBYtyu0N3347GiAP
         apGM0fwtuoJeoOQQMpB6Ou3B2LngIls+JOKWnzVRanZeZqnTbzWv2S6qtBRnTg+lVRSN
         ljbzYi32ugVWAiAoEXu4FdeeRFCCyQPXrPLOAuhcvybQfgeWBtvdbGTeJzQAITUxCJ+s
         eE8bVjQe6873IiXcayhxM84a55KQIYH158RwYefHS1dPPAlRSUKc1N/hqWY3vl8sHikq
         BFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785363301; x=1785968101;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9+pHOSPaCeM0QIhBWgFWRt9ApyE24b2tyIl3LwMdDZA=;
        b=qMAsPoWXNXztMVryzs5KqzUvyPrX96LXNRE2eb75ZYApHuPPVmjPqXBvN+KGiZ9+Is
         7BU//nBUXe0eGpGwIrUQf4ghdghTd4bQCZcFdxklpA+RBx8aGE3sERr5xLimOaNu6Q1i
         JrtNo4AwPs85WLmuja83cylw+Q0WSVHRSqskL2jvOoOEKktkaodr7zNY6qvwqsU1xs6t
         plTdNsc/666+RYbGm8xjW6YcYg84nuF9AqHTvWVJuv6z8kOtm+zT7LNFnmODkngvgnx3
         Y0TgrPQa77wNy+bqiDP9dGWrD6mI/gVdAeG1izPLj7Nb/OZjr4gKklfHgWQql03jhS9k
         PxKg==
X-Gm-Message-State: AOJu0YzjRf5vBR9NxmzMIjEQauP/MsP359yFCzASBf9zZH7DehrvRaaa
	8jMqklYTnHTOUe5lKvLm53kWuT5QzjWZQ05z3LPVe1ve0LizpGKPrpi8gPyjGvrfmf6YUzU8IgX
	s06aFWjVcFA==
X-Received: from dybih50.prod.google.com ([2002:a05:7301:30b2:b0:314:3eac:8ca1])
 (user=asavery job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4d0c:b0:38c:e9e9:e7ce
 with SMTP id 98e67ed59e1d1-38f9bd3ef76mr84420a91.3.1785363300468; Wed, 29 Jul
 2026 15:15:00 -0700 (PDT)
Date: Wed, 29 Jul 2026 15:14:58 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260729221459.1006-1-asavery@google.com>
Subject: [PATCH] platform/chrome: lightbar: Enforce 8-bit payload limit
From: Alexis Savery <asavery@google.com>
To: tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev, Alexis Savery <asavery@google.com>
Content-Type: text/plain; charset="UTF-8"

The LIGHTBAR_CMD_SET_PROGRAM_EX command encapsulates its payload data
with an 8-bit size field `uint8_t size`. However, the driver currently
allows the payload chunk to bypass this limit if the EC transport layer
supports a larger max_request.

When this occurs, large payloads (e.g., >255 bytes limit) overflow the
8-bit size variable when assigning `param->set_program_ex.size`, causing
truncation and parse failures in the EC firmware.

This change functionally clamps max_size dynamically against the struct
maximum (255 bytes).

Signed-off-by: Alexis Savery <asavery@google.com>
---
 drivers/platform/chrome/cros_ec_lightbar.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
index 02a6c34e68e6..a8df36260419 100644
--- a/drivers/platform/chrome/cros_ec_lightbar.c
+++ b/drivers/platform/chrome/cros_ec_lightbar.c
@@ -496,9 +496,16 @@ static ssize_t program_store(struct device *dev, struct device_attribute *attr,
 			return -EINVAL;
 		}
 	} else {
+		/*
+		 * The LIGHTBAR_CMD_SET_PROGRAM_EX payload uses a uint8_t size field.
+		 * Thus, independent of the transport limits, the maximum payload subset
+		 * that can be transmitted in a single structure is 255 bytes.
+		 */
+		const size_t max_struct_payload = 255;
 		extra_bytes = offsetof(typeof(*param), set_program_ex) +
 			sizeof(param->set_program_ex);
-		max_size = ec->ec_dev->max_request - extra_bytes;
+		max_size = min((size_t)(ec->ec_dev->max_request - extra_bytes),
+			       max_struct_payload);
 	}
 
 	msg = alloc_lightbar_cmd_msg(ec);
-- 
2.55.0.508.g3f0d502094-goog

