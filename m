Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851BEA29
	for <chrome-platform@lists.linux.dev>; Thu, 23 May 2024 01:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716427805; cv=none; b=sa7N/gOlmDe1sRngcMuYKG+GGn1DQiUhrcJ6HzDWcRLLefuyyivzhRJi6WnCAmmCAw7EvTa7yxqdoo5zwdHsYOjs4SgyEOwuZhe85DD5FFBs2eoAr5o/cr0A8opYJM6AJ/ort6kIPHj6p+YTR02iGQFBfDpu5l/KKa7CeVoac7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716427805; c=relaxed/simple;
	bh=ImCUcNISjZFKX1UIRsmGU4T/HVNmFo/PzU3zMKXhjBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DuBfV4jxt/HklUw88BPoO/6Y5rPPHIjvkG+8xLn0uslBxQz05Bio5pJDesvnHQuCV91fg51FjEipWu/wxdKY1rqlF8StzyAfBZX61FkHbTZttAHZaJK0+ET4tz82YyT37vHwIkvnR8ptC1D0XcFeKvCrYVvU+jajeRCenyjqbcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJV3/1sB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJV3/1sB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B9AC2BBFC;
	Thu, 23 May 2024 01:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716427805;
	bh=ImCUcNISjZFKX1UIRsmGU4T/HVNmFo/PzU3zMKXhjBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nJV3/1sBGWk84izQk3cKONl0ZpLpxlcFFhtrBTnMC4OVxlaY0Gj/dsqr3ByCd2Kyp
	 IQo+6dMit99sGVZpiJRR1hS+ZeXIQ2xP99Hku5kCAUMjf/VV5+2EAk0Hz1QQ4vXVwi
	 /h+ctx5UgxmC0vQXcs6KrbtqtIMcLrsY9tUx2PrvUpNOLmrVXnIEaha2+jdagqF0CL
	 hWuNQOT4zMoJzu3JGw06etGb77mVvKZOyWRqqpxNaf6oVpEzR9aGj5YJEEim5B4K5k
	 GTwsSp2B3jI+KKTfa8mW5siSLKbu24EqSUJOmO7P+XGWlyEC9xEPQ1dpr3x5jJUQdy
	 zT5u4tvW0rhVA==
Date: Thu, 23 May 2024 09:30:02 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Rob Barnes <robbarnes@google.com>
Cc: chrome-platform@lists.linux.dev, gwendal@chromium.org,
	groweck@chromium.org
Subject: Re: [PATCH] drivers/cros_ec: Make log polling period a parameter
Message-ID: <Zk6cGhB99cktsCsy@google.com>
References: <20240507155809.525701-1-robbarnes@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507155809.525701-1-robbarnes@google.com>

On Tue, May 07, 2024 at 03:58:09PM +0000, Rob Barnes wrote:
> Make EC log polling period a module parameter. This allows the polling
> period to be set via the kernel command line. Keeping the default at
> the current 10 second period. The optimal polling period will differ by
> board.

If you get chance for sending next version, please use title prefix
"platform/chrome: cros_ec_debugfs:".

> @@ -118,7 +122,7 @@ static void cros_ec_console_log_work(struct work_struct *__work)
>  
>  resched:
>  	schedule_delayed_work(&debug_info->log_poll_work,
> -			      msecs_to_jiffies(LOG_POLL_SEC * 1000));
> +			      msecs_to_jiffies(log_poll_period_ms));

If the value is set to 0, it works like an infinite loop on
cros_ec_console_log_work().  Is it expected?
