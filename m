Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081235;
	b=P4mxKHAyO69JY4BWFM59PVgwf6q0pC/fxiGwGJQACc3CplWEzxV0fEFhDXef6FGupPs/
	 i3qgJOGPINPoyiMM9bo9+PPH9RDjRvLQKx8FpUKtB2+fkcWl40bMVbR09wPGrGAuZwjtO
	 3T80wFd7TsQI+5RwkKBNnsqiIPWpC0OsLxcPs35qO9c06KyS6sTWANNXyI5Q3mf7eQZnL
	 q92EfvVygU7nXALIys/q0UyHN0GAmZPnIIe+tFwUdlEtUPvFl/LE7oLIC07oeJSdS7VCo
	 J27mwl4bfIwGwyU2+K3o/IkHVvVWXaqRRDXUdllQpOdidlmNarFCoDixIrfsHXRBsnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081235;
	h=DMARC-Filter:DKIM-Signature:Cc:From:Content-Type:X-Lms-Return-Path:
	 Content-Transfer-Encoding:References:To:Date:Message-Id:Subject:
	 Mime-Version:Received:X-Original-From:X-Mailer:In-Reply-To;
	bh=9Rhlrsd3szVwXHApQsxbvat4ytGyJqWvh7lnq+1BZZk=;
	b=RuxyvvWXr3hGfy/LI4ATsty2dnw3MGZO6bfEnbnW/u79bALgcW959hW9ouKpfs9TT+NQ
	 vB9fZAOc5YstWTtX0Ngm7vgpfPSdHOs7TJFMds+FtOUegrPHJTeFjZtmbr+ou7pW/3/AS
	 iGl5LOvtP7ZsFtY+bqWwGVOE9T2lNF1K7Qd3rhCQD9y+uMK9oEZwGuucX1+nhzfbBKV0g
	 tvpV1DRAuh40mI1UFvvyxggSh+GDxcnQdnBSeds0rEidE3ZrwoKe91HvG2KEwpMsd/nPh
	 ZR5LY4IWc1uE6NJQ8wN2DPzWS4OtsBT1EPoHrVFsJfKH0yVVG55b/XxSD5i80jYN3Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=rMj0eB1N;
	arc=none smtp.remote-ip=209.127.231.38
Received: from va-2-38.ptr.blmpb.com (va-2-38.ptr.blmpb.com [209.127.231.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0241606A320
	for <chrome-platform@lists.linux.dev>; Thu, 19 Nov 2026 09:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0241606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=rMj0eB1N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1795081230;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=9Rhlrsd3szVwXHApQsxbvat4ytGyJqWvh7lnq+1BZZk=;
 b=rMj0eB1NfVtEKTaQ++TCwT67NBWyuEc8bCg33V2kewYMsFGXFrT/NSNF3PvgoLia7Ent9G
 X7LRyIAEsHtzsQWcD1vjFe74VqApVjuYjPbuUXdk2fQ+7YpCGgeeK0YD+/C3a23T44eE+y
 NQCGUoZInrtaFRL5g0pJ962hSDMZk/DMQGZrV5iGKcPbdXi4Q4vdcNhfkcXJBUThmg8+WF
 +XvT8PUsu3XMUEVsbpkrK84zpE4msLqIvIIPHRhOTKtYqaxHt8A8kNgz6iWxvVAUHZCwn+
 rkHNaWYFNKgoyxsspQm+vw54S3LV2U60yHzflwPHuuNqftbAs1VJDjJLdsoUYA==
Cc: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
From: "Wang Yang" <yang.wang@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
X-Lms-Return-Path: <lba+26afec40c+e20e66+lists.linux.dev+yang.wang@deepcomputing.io>
Content-Transfer-Encoding: 7bit
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io> <20261118085742.1817536-4-yang.wang@deepcomputing.io> <av4UUyCtDBJNU0h5@aurel32.net>
To: "Aurelien Jarno" <aurelien@aurel32.net>
Date: Thu, 19 Nov 2026 17:40:20 +0800
Message-Id: <20261119094020.1888153-1-yang.wang@deepcomputing.io>
Subject: Re: [PATCH 3/9] bus: Add SpacemiT K3 eSPI controller support
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Received: from ubuntu.. ([183.23.99.162]) by smtp.feishu.cn with ESMTPS; Thu, 19 Nov 2026 17:40:27 +0800
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <av4UUyCtDBJNU0h5@aurel32.net>

Hi Aurelien,

Thank you for pointing out the AMD RFC. I missed it during the
initial search.

I have now looked through the RFC and its follow-up discussion.
I am still checking how K3's CPU-mapped Peripheral Channel window,
device enumeration and link recovery could fit into that framework.
I will take this work into account before posting the next revision.

Thanks also for pointing out the EC on SpacemiT's K3 Pico-ITX
development board. I understand that its EC uses the same eSPI
hardware interface as the EC on FML13V05. Keeping the controller
separate from the EC transport should allow the support to be
shared between the two boards. My validation so far has been
limited to FML13V05.

Regards,
Wang Yang
