Received: from gateway24.websitewelcome.com (gateway24.websitewelcome.com [192.185.50.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECCF3B56
	for <chrome-platform@lists.linux.dev>; Wed, 16 Mar 2022 22:21:42 +0000 (UTC)
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
	by gateway24.websitewelcome.com (Postfix) with ESMTP id E22634F92
	for <chrome-platform@lists.linux.dev>; Wed, 16 Mar 2022 17:00:45 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with SMTP
	id UbhFnTtmiXvvJUbhFndobK; Wed, 16 Mar 2022 17:00:45 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+EN76LAv4Rpy9L6vlmfBnRuRAIdoCJ8c/rlWzq3TISs=; b=46bT9rraQneSjZP5D5/5NHc3O7
	axGdRuLYql6jJmkhaMF1+VTfnzk66m+vyqycLL/Uj7p/+FiTPUBEhXonXX3Wks549amnbwHxn8VXJ
	DFlGVr3voKX5xfhz7rpIm5V/8r9RSjm/iMHueZWQR4jeLR8gTAKzWm+9d6L/PJYuE3nygq/Q4QMQN
	tCIjSyM+9N3ZnZjnCVWGaQHBSVTMmqEhPlPjQIdfuEksiskWoe2JABQt+NWmXISQrnEZrG8TOHiWi
	39oL5C7K5Va65ste5MMAZ3LJc9mdQ3AowcBjkqed6vR153NPP+yI4fqjoMtSzdj4uYwjKcSDLi7eK
	zUCynjGg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54308)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@roeck-us.net>)
	id 1nUbhF-001r7X-E1; Wed, 16 Mar 2022 22:00:45 +0000
Message-ID: <dff75b5c-5ac2-843d-6a29-61f2eefc122a@roeck-us.net>
Date: Wed, 16 Mar 2022 15:00:44 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] MAINTAINERS: Add chrome-platform@lists.linux.dev to all
 Chrome OS entries
Content-Language: en-US
To: Benson Leung <bleung@google.com>
Cc: chrome-platform@lists.linux.dev, Benson Leung <bleung@chromium.org>,
 Rajat Jain <rajatja@google.com>
References: <20220316184945.452379-1-linux@roeck-us.net>
 <YjJF71/B8Yb8cirZ@google.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <YjJF71/B8Yb8cirZ@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nUbhF-001r7X-E1
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:54308
X-Source-Auth: linux@roeck-us.net
X-Email-Count: 3
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes

On 3/16/22 13:17, Benson Leung wrote:
> Hi Guenter,
> 
> On Wed, Mar 16, 2022 at 11:49:45AM -0700, Guenter Roeck wrote:
>> Add the chrome-platform@lists.linux.dev mailing list to all Chrome OS
>> maintainer entries to ensure that people copy the list when submitting
>> Chrome OS specific patches. This also helps ensuring that patches are
>> available in a patchwork instance.
>>
>> Cc: Benson Leung <bleung@chromium.org>
>> Cc: Rajat Jain <rajatja@google.com>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> I added this back in January.
> https://lore.kernel.org/r/20220126222233.2852280-1-bleung@chromium.org
> 
> It should already be in linux-next:
> https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git/commit/?h=for-next&id=664de6a26b7f17eebca896c3e18201b15d5c7b19
> 
> Let me know if it didn't show up there for you.
> 

Ah, I only checked mainline. Sorry for the noise.

Guenter
