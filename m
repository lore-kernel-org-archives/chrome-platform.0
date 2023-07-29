Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359373C2A
	for <chrome-platform@lists.linux.dev>; Sat, 29 Jul 2023 11:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2EF5C433C7;
	Sat, 29 Jul 2023 11:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690629672;
	bh=Da5qqJ00EwlvAqge1RCcLr/wQtNOocebrT9i5qo8yfU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JZ7R701lOTslitnU6OdT1l/LSLMenkwtITPXYYE1nAxnDdsO4TxCK21LT9rsJNbzA
	 TN072ACoCxBfv5vYyjnnxvLPk+xdqU5mxAbuiUqqM1f78WSpl216Dy1XiXyKA1iCdE
	 QqeIRwc2Ukxrap6cTkWAiJiBjZqiCUL4/xWujANC5bcMg7DrTYAGDrN5dMGW1g0JY4
	 MY4hqxAigZAuR0s2rm09d5gIhIhSRZRe7V9atK6HQVuB7Mavmz+eVeGQaY2FMW4Hgc
	 3Ch2Lv680PXua1i6AKfI75RArNfKva1s2Rg3jAqals/h7gb+1M71wyypTEdUffQchz
	 zDfjtdj3euYdA==
Date: Sat, 29 Jul 2023 12:21:15 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Yiyuan Guo <yguoaz@gmail.com>,
 <lars@metafoo.de>, <bleung@chromium.org>, <groeck@google.com>,
 <dianders@chromium.org>, <mazziesaccount@gmail.com>,
 <gwendal@chromium.org>, <linux-iio@vger.kernel.org>,
 <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH v3] iio: cros_ec: Fix the allocation size for
 cros_ec_command
Message-ID: <20230729122115.6c2b2593@jic23-huawei>
In-Reply-To: <20230718103702.0000546e@Huawei.com>
References: <20230630143719.1513906-1-yguoaz@gmail.com>
	<20230716141028.4c57c5c7@jic23-huawei>
	<ZLSw1FxccNOqE52C@google.com>
	<20230718103702.0000546e@Huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 18 Jul 2023 10:37:02 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:

> On Mon, 17 Jul 2023 11:09:08 +0800
> Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> 
> > On Sun, Jul 16, 2023 at 02:10:28PM +0100, Jonathan Cameron wrote:
> > [...]  
> > > 2) Various people commented on earlier versions, and I'm waiting for them to confirm
> > > they are fine with this version.    
> > 
> > The version addressed all my comments and LGTM.  
> 
> Tag?  I can pick up without, but it's nice to record this
> formally.   Reviewed-by seems appropriate here.

Applied to the fixes-togreg branch of iio.git.

Note the fixes tag had to be replaced with the full version.
No shortening allowed.

Jonathan
