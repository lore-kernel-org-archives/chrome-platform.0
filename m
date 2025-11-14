Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3E530748C
	for <chrome-platform@lists.linux.dev>; Fri, 14 Nov 2025 09:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763112085; cv=none; b=WPHP2PXFNiqt2QB6X6iUdAAB7ksWG4tqg6emW5j71MRLf1JC53FiYZUkb1TMhx1DWXraOrmaMdCPFAMTjejUWTVVw651LbDKpQ89uzPsaTAH3Pq+QXUDHte/7lvXUFHpiButimyFAjbPpMBbRNAuiN1XW6+j5FvBxJyzeFJf0yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763112085; c=relaxed/simple;
	bh=MKsv1hqOh7YDR7PTSlAupDUTIIJN1vTHAYFd8aDMs2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lK3NALhCtbrTuq7uBfrS1fcVYW9rYxeT/VgZkGqCStPGOHFR4woEW/hIaqbb9JtSpoAcfudfC8H1F3/Y0ArQhXeb7+u+nUF5goQDnoMq7IwlEMhSJ8ZAN06kerlruKZ+DF5BuvzMxiIdq9dhiQ7Apkq4BshU2bBXhdm+icoU0Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=rv7j37n2; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="rv7j37n2"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id C8DF06005418;
	Fri, 14 Nov 2025 09:21:14 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id LcBPG4MF_xtR; Fri, 14 Nov 2025 09:21:12 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id BEC746000852;
	Fri, 14 Nov 2025 09:21:11 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1763112071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C6pG4d73fKASjLD3WLaVraPZ7a327f6ngV6hCafBEFw=;
	b=rv7j37n2yujnzWPGVFQBF8lq6MWLY6X00dKgB1fBS2Ivj2cgZNyEW34PZCYhKjLzch0I2j
	H8WFLtyziZ0JQeJik/Ia8O/ONe+IGh21QmO4JWlmr9MnCIqVh4LcQjtU9+APL4zrUzK62r
	7H3EWpUz4/2mmt8k6sQznNh6gTk0raUM5DMJQ1lNvoE8RpGO9qi9anTyUWssqr/OSsmzrs
	AP8KFw9H8km14nG7+cv0ovJuqJIHbcNgmFEyZBgZX+mgkdOGGL3UxReo9eSeGyF6pC+MPT
	rAhcka+38s9avwj9pItZMJF6qWosu4xRCOqjgzCTuql+eag3R2RJK9FhhNV9aQ==
Received: from [IPV6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 52195360125;
	Fri, 14 Nov 2025 09:21:11 +0000 (WET)
Message-ID: <a33b1286-8c90-43e4-a369-e21b1614545d@tecnico.ulisboa.pt>
Date: Fri, 14 Nov 2025 09:21:09 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/chrome: sensorhub: Support devices without
 FIFO_INT_ENABLE
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251112-diogo-smaug_ec_sensorhub-v1-1-f71d4e9eb9d4@tecnico.ulisboa.pt>
 <aRaf39MnKjA3q6iL@google.com>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <aRaf39MnKjA3q6iL@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/14/25 03:19, Tzung-Bi Shih wrote:
> On Wed, Nov 12, 2025 at 04:00:12PM +0000, Diogo Ivo wrote:
>> In order to fix this, since the EC does not provide a way to determine
>> a priori if there is support for FIFO_INT_ENABLE send this command
>> unconditionally and carefully interpret the return value -EINVAL as a
>> device where FIFO_INT_ENABLE is not present and the interrupt is always
>> enabled.
> 
> Thanks for looking into this.
> 
> Simplified the commit message and some side notes:
> - -EOPNOTSUPP[1] for learning if a EC command is unsupported.
> - FIFO_INT_ENABLE is a sub-command of EC_CMD_MOTION_SENSE_CMD.
> - It likely falls into [2].

In the case of Smaug the subcommand FIFO_INT_ENABLE is not present in
the switch (in->cmd) statement and thus we return EC_RES_INVALID_PARAM
from host_cmd_motion_sense() [3]. My reasoning for the workaround was
that on the EC code EC_FEATURE_MOTION_SENSE_FIFO is dependent on
CONFIG_ACCEL_FIFO [4] and the kernel checks for this EC_FEATURE when
handling a possible sensorhub [5], meaning that when we call
FIFO_INT_ENABLE then CONFIG_ACCEL_INFO is defined in EC code and we are
not hitting [2].

Thanks,
Diogo

> [1] https://elixir.bootlin.com/linux/v6.17/source/drivers/platform/chrome/cros_ec_proto.c#L22
> [2] https://crrev.com/30c5bc8e822436e6a74b36adc24d71293a5ba9c2/common/motion_sense.c#1438

[3]: 
https://chromium.googlesource.com/chromiumos/platform/ec/+/refs/heads/firmware-smaug-7900.B/common/motion_sense.c#914
[4]: 
https://chromium.googlesource.com/chromiumos/platform/ec/+/refs/heads/main/common/ec_features.c#88
[5]: 
https://elixir.bootlin.com/linux/v6.17.7/source/drivers/platform/chrome/cros_ec_sensorhub.c#L204

> Changed the commit message and code comment, and applied to
> 
>      https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next
> 
> [1/1] platform/chrome: sensorhub: Support devices without FIFO_INT_ENABLE
>        commit: 52075d2c7595cfd6c1ce211a9cd138a9b067c448
> 
> Thanks!
