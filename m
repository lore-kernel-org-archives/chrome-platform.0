Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7E330C37E
	for <chrome-platform@lists.linux.dev>; Fri,  3 Apr 2026 22:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775255654; cv=none; b=RZsJzA/e6uNSX1BotzTtpMpwIFPs2F2vPsmXOZoRKS6Fmv0XGJsALN4saXfHRMRyaoEJnkgSbNCESYQ8Gk7RQNbATcUblxeta2Y2JuOmaXN5t7+5QVnrcdA7G/LLeEb/0WfQCRfqhZw3TQhxgYCITktbG7UHp6ic9at3aXMtcqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775255654; c=relaxed/simple;
	bh=/qTb5D8k5mJijhAYXco0XNumuwHJi4yRgl5gjCxIuIs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gsjyTebbeofGHGc0rdDSd2g4RMQl923lryCc4s+RCJIgCGTFE7Ab69NTF1qcSJ6YA8dl+FUqsnoPM5SyRYLIOGkLaqm83H4+KY97FAZKUrgcLL9rFKd8GZtKV2i5e0BHjm30hrtVuEChkV0Y+k8AqOAGuaDdIbQD4SZ6IEZRBG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sj3SPinN; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sj3SPinN"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2c895e7de52so7457758eec.0
        for <chrome-platform@lists.linux.dev>; Fri, 03 Apr 2026 15:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775255651; x=1775860451; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xp7Dbgf5b3g15NbF7ANO4wBuM9L4b5vcD63pgQCNCTU=;
        b=sj3SPinNNCVdXfiOT7TWdhJmAQFk8XmA6sWOkDQWAWtA2c7H+F03rcxG6Yeoq5fZoQ
         yZk/fTbjmW1HqBTXF1K5+5TCWtwwi6iDylKi9//+W57ZnY/o5Wqr78Hfzb5Id3BWySqR
         UnwfqKCAR94IrEw4Z0Begs5/1/n4ui+lhBp8x0niHt92L0eHG5lg+MxTpkaCtqefc/cq
         yLhGw7e6aNQ+lVsfPoGyZsVfzy92NuYHQC3OVgB2mqEUfDJA/oFZ7UK5Yw3c8oHy3roD
         ifMru2O+20Q8ImwEPdYtYk6MIxCnt2EE/e+OjiAwrDJsq+s2pxQOtBSq9NvD6juj1s+s
         +/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775255651; x=1775860451;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xp7Dbgf5b3g15NbF7ANO4wBuM9L4b5vcD63pgQCNCTU=;
        b=swfM8TcRVSlvQe7bMjJCWH8LPcOcFYq9MELjn2LU+0X7LwLC1QOR2MRh9lRd+6AORs
         RvHb8IJi7fGAFogAIcSXv9F5bmOBjCVW/1IbF96Ql8fAq9MaYjp+38hgsRWpk0XCr3Dc
         tpwVzO8K5pDCSW5xirjHeoWYgqXWxSyUZqtxIDxFDH1g3+1g0t0jqZVz4yBUyV2+HvKR
         LZ4GvTPZFUX7V+rXjuBOhcWOgGXVIIcp9ucxw0sY7TRzDcFcpaY9FLkowCNdmy0b1Fiq
         rnAsxOWmxh9/N4lzLSrhxPeLRBTcCZAiAUPZSzRg1UuwJsGaTx03/yjSCLmErO2iSdby
         mO/w==
X-Forwarded-Encrypted: i=1; AJvYcCUdh0q1xR+f5lFF1XNJTpRMwAmGVj3gtAD3pOiANb1k8J2p3SHZ8kTxODIspsOF3ROknLtUN9RgmC/MwupXcNw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAAi32GKC0FT0dyJuhV7jege7Omf7lVoQxUt+PSYtjELRTcYkE
	mBWUeL8Jga9PdIWIdZN5zKX2up21mPaiX0lYNRgVkDJeg2cWq//EHne8exZ8psauPBC1QDgIxfV
	0rDIhiw==
X-Received: from dyz21.prod.google.com ([2002:a05:693c:4095:b0:2c8:6bd1:63ba])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:1288:b0:2c7:11f2:d081
 with SMTP id 5a478bee46e88-2cbfad9a862mr2379820eec.14.1775255651164; Fri, 03
 Apr 2026 15:34:11 -0700 (PDT)
Date: Fri,  3 Apr 2026 22:33:25 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260403223357.1896403-1-jthies@google.com>
Subject: [PATCH v1 0/2] Load cros_ec_ucsi from OF and ACPI nodes
From: Jameson Thies <jthies@google.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	abhishekpandit@chromium.org, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, akuchynski@chromium.org
Cc: gregkh@linuxfoundation.org, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

Hey everyone,
I sent these patches up as part of a larger series in late 2025 which
hasn't mergerd. The initial series modified dt-bindings, mfd and usb
subsystems, but had not been reviewed by mfd maintainers. Additionally,
it had not been acked by maintainers all land through one development
tree.

For context, here is the previous series
https://lore.kernel.org/all/20251013203331.398517-1-jthies@google.com/

I've split the series up, this is just the usb and dt-bindings update.
It builds independent from the mfd change.

Given the time since this was previously under review (~oct 2025), I've
cleared the exising review tags. Please take a look and let me know if
you have any questions.

Jameson Thies (2):
  dt-bindings: chrome: Add cros-ec-ucsi compatibility to typec binding
  usb: typec: cros_ec_ucsi: Load driver from OF and ACPI definitions

 .../bindings/chrome/google,cros-ec-typec.yaml | 19 +++++++++++---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c         | 26 +++++++++++++++++--
 2 files changed, 39 insertions(+), 6 deletions(-)


base-commit: 81ebd43cc0d6d106ce7b6ccbf7b5e40ca7f5503d
-- 
2.53.0.1213.gd9a14994de-goog

