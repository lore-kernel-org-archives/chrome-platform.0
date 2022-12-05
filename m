Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA38017D1
	for <chrome-platform@lists.linux.dev>; Mon,  5 Dec 2022 06:18:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995A9C433D6;
	Mon,  5 Dec 2022 06:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670221128;
	bh=W33NQFED21c+6UVqfmxS3Py544P8P6AaTZgzm21x5xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZI0BVErdNz6S3GY+S1GvVTKarxwpU8wiqJa3zFwHVZO6g1qDAy7EDQJO5kg5xE9sk
	 3TQttRYx24UuXXEbnThaFcoJHbt6bUHXNjOSBGGaniK85qHxnQHbxhAcPZ39UjaYYW
	 snQNq3ILOyofYAe2LEQ0CdIf2XCf9ts9oANlhs/f36XCL1m/3ftUFvWrWmqc3N/EL2
	 +jZ7wh+0SXpMNKhkRjOjOPJke1SXaU9HWR5aP2op1flCtXzlWKW8/VAssL901VUb8G
	 1N6yth0YFC7P2F20nhBO9zPi1Zo0Ps+HoT0Lt5TA15kI/8hnyNBSTIY1c4wJoVVHLu
	 rcEQVeTFKgZwA==
Date: Mon, 5 Dec 2022 14:18:45 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: ye.xingchen@zte.com.cn
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: use sysfs_emit() to instead of
 scnprintf()
Message-ID: <Y42NRVo9BH+EWpiF@google.com>
References: <202212021656040995199@zte.com.cn>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212021656040995199@zte.com.cn>

On Fri, Dec 02, 2022 at 04:56:04PM +0800, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Follow the advice of the Documentation/filesystems/sysfs.rst and show()
> should only use sysfs_emit() or sysfs_emit_at() when formatting the
> value to be returned to user space.
> 
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Fixed the commit message a bit and queued the patch.

Also, I found a little more here: https://patchwork.kernel.org/project/chrome-platform/patch/20221205061042.1774769-1-tzungbi@kernel.org/
